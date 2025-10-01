# Raspberry Pi Linux Cross-compilation Environment

This environment can be used to [cross-compile the Raspberry Pi OS kernel](https://www.raspberrypi.org/documentation/linux/kernel/building.md) from a Linux, Windows, or Mac workstation using Docker.

You can also skip the 'Bringing up the build environment' section and just compile the kernel directly on the Pi itself.

This build configuration currently targets Raspberry Pi 5, CM5, and Pi 500/500+, and on macOS using Docker Desktop, using the Pi OS 64-bit build.

## Bringing up the build environment

  1. Install Docker (and Docker Compose if not using Docker Desktop).
  1. Bring up the cross-compile environment:

     ```
     docker compose up -d
     ```

  1. Log into the running container:

     ```
     docker attach cross-compile
     ```

You will be dropped into a shell inside the container's `/build` directory. From here you can work on compiling the kernel.

> After you `exit` out of that shell, the Docker container will stop, but will not be removed. If you want to jump back into it, you can run `docker start cross-compile` and `docker attach cross-compile`.

## Compiling the Kernel

**If compiling on the Raspberry Pi directly**: omit the `ARCH` and `CROSS_COMPILE` options, and install required dependencies with: `sudo apt install -y git bc sshfs bison flex libssl-dev python3 make kmod libc6-dev libncurses5-dev`.

  1. Clone the linux repo (or clone a fork or a different branch):

     ```
     git clone --depth=1 https://github.com/raspberrypi/linux
     ```

  1. Run the following commands to make the .config file (change the `bcm2712` to `bcm2711` if compiling for Pi 4/400/CM4):

     ```
     cd linux
     make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcm2712_defconfig
     ```

  1. (Optionally) Either edit the .config file by hand or use menuconfig:

     ```
     make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig
     ```

  1. Compile the Kernel:

     ```
     make -j6 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules dtbs
     ```

> I set the jobs argument (`-j6`) conservatively. If you have more processor cores, you may be able to speed up compilation with a higher number, like `-j8` or `-j10`.

**If you're cross-compiling the kernel**: proceed to the next sections.

**If you're compiling the kernel on a Raspberry Pi**: install the new kernel and kernel modules directly, then reboot the Pi:

```
KERNEL=kernel_2712
sudo make -j6 modules_install
sudo cp /boot/firmware/$KERNEL.img /boot/firmware/$KERNEL-backup.img
sudo cp arch/arm64/boot/Image /boot/firmware/$KERNEL.img
sudo cp arch/arm64/boot/dts/broadcom/*.dtb /boot/firmware/
sudo cp arch/arm64/boot/dts/overlays/*.dtb* /boot/firmware/overlays/
sudo cp arch/arm64/boot/dts/overlays/README /boot/firmware/overlays/
```

## Editing the kernel source inside /build/linux

For the benefit of silly Mac users like me, I have a 'reverse NFS' mount available that lets me mount the linux checkout _from_ the container _to_ my Mac, meaning I can edit files from inside the container in a code editor on my Mac (like Sublime Text or some other IDE).

This is helpful because:

  - Most macOS installs don't have case-sensitive filesystems, so Linux codebase checkouts (which have files with duplicate filenames) will break.
  - Docker for Mac is funny and runs in a VM, so if you mount a local (host) directory into the container, performance goes down the drain.

To connect to the NFS share, create a folder like `nfs-share` on your Mac and run the command:

```
sudo mount -v -t nfs -o vers=4,port=2049 127.0.0.1:/ nfs-share
```

## Copying built Kernel via remote SSHFS filesystem

It is most convenient to manage the built modules by copying them over to a running Pi, instead of doing a microSD card swap dance every time you recompile.

One prerequisite for this particular method is to make sure you can mount the remote Pi's filesystem via `sshfs`.

The easiest way is to run the `setup.yml` playbook:

  1. Install Ansible.
  2. Make sure the `inventory.ini` points at your Raspberry Pi (change the `127.0.0.1` IP address to the IP of the Pi on your network) and you can SSH into it.
  3. Run `ansible-playbook setup.yml`.

If you want to set it up manually instead, do this:

  1. On the Pi: edit `/etc/ssh/sshd_config` and uncomment `PermitRootLogin`, then restart `sshd`.
  2. Create an SSH key in the container, and copy the public key to the Pi's root user `authorized_keys`.

### Install kernel modules and DTBs via SSHFS

The best option is to use the Automated script. Within the container, run the command:

```
PI_ADDRESS=10.0.100.170 copykernel
```

> Change the `PI_ADDRESS` here to the IP address of the Pi you're managing.

The script will reboot Pi, and once rebooted, your new kernel should be in place!

#### Manual kernel module install via SSHFS

Or, if you want to run the process manually, run:

```
mkdir -p /mnt/pi-ext4
mkdir -p /mnt/pi-fat32
sshfs root@10.0.100.119:/ /mnt/pi-ext4
sshfs root@10.0.100.119:/boot /mnt/pi-fat32
```

Install all the kernel modules:

```
env PATH=$PATH make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=/mnt/pi-ext4 modules_install
```

Copy the kernel and DTBs onto the drive:

```
cp arch/arm64/boot/Image /mnt/pi-fat32/kernel_2712.img
cp arch/arm64/boot/dts/broadcom/*.dtb /mnt/pi-fat32/
cp arch/arm64/boot/dts/overlays/*.dtb* /mnt/pi-fat32/overlays/
cp arch/arm64/boot/dts/overlays/README /mnt/pi-fat32/overlays/
```

Unmount the filesystems:

```
umount /mnt/pi-ext4
umount /mnt/pi-fat32
```

Reboot the Pi and _voila!_, you're done!

### Hard Reset on the CM4 IO Board

If you get a fatal kernel panic that doesn't get caught cleanly (which I do, quite often, when debugging PCI Express devices), you can quickly reset the CM4 IO Board by jumping pins 12 and 14 on J2 (`GLOBAL_EN` to `GND`).

You can also 'boot' a shutdown CM4 by jumping pins 13 and 14 on J2 (`GLOBAL_EN` to `RUN_PG`).

### Kernel Headers

If you also need the kernel headers and source available, you can do the following (before unmounting the filesystems):

```
# Get the kernel version (usually the last in the listing):
sudo ls -lah /mnt/pi-ext4/lib/modules

# Create a directory and copy the sources into it:
sudo mkdir /mnt/pi-ext4/usr/src/linux-headers-5.10.14-v8+
sudo rsync -avz --exclude .git /home/vagrant/linux/ root@10.0.100.119:/usr/src/linux-headers-5.10.14-v8+

# Update the symlinks in the modules directory on the Pi:
sudo rm -rf /mnt/pi-ext4/lib/modules/5.10.14-v8+/build
sudo rm -rf /mnt/pi-ext4/lib/modules/5.10.14-v8+/source
sudo ln -s /usr/src/linux-headers-5.10.14-v8+ /mnt/pi-ext4/lib/modules/5.10.14-v8+/build
sudo ln -s /usr/src/linux-headers-5.10.14-v8+ /mnt/pi-ext4/lib/modules/5.10.14-v8+/source
```

This is sometimes necessary if you're compiling modules on the Pi that require kernel headers.

> Note: This... doesn't work. I opened this issue to see if I could figure out the way: [Getting headers for custom cross-compiled kernel?](https://www.raspberrypi.org/forums/viewtopic.php?f=66&t=303289).

## Copying built Kernel via mounted USB drive or microSD

The other option is to shut down the Pi, pull it's card or USB boot drive, and connect it to your computer so it can attach to the VM.

Mount the FAT and ext4 partitions of the USB card to the system. First, insert your microSD card into the reader you attached to the VM earlier, then run the following commands:

```
mkdir -p mnt/fat32
mkdir -p mnt/ext4
sudo mount /dev/sdb1 mnt/fat32
sudo mount /dev/sdb2 mnt/ext4
```

Copy the kernel and DTBs onto the drive:

```
sudo cp arch/arm64/boot/Image mnt/fat32/kernel_2712.img
sudo cp arch/arm64/boot/dts/broadcom/*.dtb mnt/fat32/
sudo cp arch/arm64/boot/dts/overlays/*.dtb* mnt/fat32/overlays/
sudo cp arch/arm64/boot/dts/overlays/README mnt/fat32/overlays/
```

### Installing modules and copying the built Kernel

Install the kernel modules onto the drive:

```
sudo env PATH=$PATH make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=mnt/ext4 modules_install
```

> For 32-bit Pi OS, use `sudo env PATH=$PATH make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=mnt/ext4 modules_install`

Copy the kernel and DTBs onto the drive:

```
sudo cp arch/arm64/boot/Image mnt/fat32/kernel_2712.img
sudo cp arch/arm64/boot/dts/broadcom/*.dtb mnt/fat32/
sudo cp arch/arm64/boot/dts/overlays/*.dtb* mnt/fat32/overlays/
sudo cp arch/arm64/boot/dts/overlays/README mnt/fat32/overlays/
```

### Unmounting the drive

Unmount the disk before you remove it from the card reader or unplug it.

```
sudo umount mnt/fat32
sudo umount mnt/ext4
```

## Resetting the build environment

If you want to reset things without wiping out the VM or re-cloning the source, run:

```
git reset --hard
git clean -f -d -X
```
