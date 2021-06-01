# Raspberry Pi Linux Cross-compilation Environment

> **NOTE**: The old Vagrant and VirtualBox-based build environment is now stored in the [`legacy-vagrant`](legacy-vagrant/) directory.

This environment can be used to [cross-compile the Raspberry Pi OS kernel](https://www.raspberrypi.org/documentation/linux/kernel/building.md) from a Linux, Windows, or Mac workstation using Docker.

This build configuration has only been tested with the Raspberry Pi 4, CM4, and Pi 400, and run on macOS.

## Bringing up the build environment

  1. Make sure Docker is installed.
  1. Build the Docker image you'll use for compilation: `docker build -t cross-compile .`
  1. Run an instance of the Docker image:

     ```
     docker run --device /dev/fuse --cap-add SYS_ADMIN --name cross-compile -it cross-compile bash
     ```

You will be dropped into a shell inside the container's `/build` directory. From here you can work on compiling the kernel.

> After you `exit` out of that shell, the Docker container will stop, but will not be removed. If you want to jump back into it, you can run `docker start cross-compile` and `docker attach cross-compile`.

## Compiling the Kernel

  1. Clone the linux repo (or clone a fork or a different branch):

     ```
     git clone --depth=1 https://github.com/raspberrypi/linux
     ```

  1. Run the following commands to make the .config file:

     ```
     cd linux
     make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcm2711_defconfig
     ```

  1. (Optionally) Either edit the .config file by hand or use menuconfig:

     ```
     make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig
     ```

  1. Compile the Kernel:

     ```
     make -j8 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules dtbs
     ```

> For 32-bit Pi OS, use `ARCH=arm`, `CROSS_COMPILE=arm-linux-gnueabihf-`, and `zImage` instead of `Image`.

> I set the jobs argument (`-j8`) based on a bit of benchmarking on my M1 Mac's processor. For different types of processors you may want to use more (or fewer) jobs depending on architecture and how many cores you have.

## Copying built Kernel via remote SSHFS filesystem

It is most convenient to manage the built modules by copying them over to a running Pi, instead of doing a microSD card swap dance every time you recompile.

One prerequisite for this particular method is to set a `root` password on the Pi and allow root password login (there are other more secure ways... this is for convenience!).

### Configuring Root Password SSH login on the Pi

Logged into the Pi with SSH, run `sudo su`, then `passwd`, and set a password.

Edit the `/etc/ssh/sshd_config`, find the `PermitRootLogin` line, uncomment it, and change the value from `prohibit-password` to `yes`. (And comment out `PasswordAuthentication` if that line is set to `no`.)

Restart SSHD:

```
sudo systemctl restart sshd
```

Now make sure you can SSH into the Pi as `root` from the cross-compile VM, with:

```
ssh root@10.0.100.119
```

### Setting up an SSHFS mount

Mount the Pi's filesystems into the cross-compile environment (requires `sshfs`):

```
mkdir -p /mnt/pi-ext4
mkdir -p /mnt/pi-fat32
sshfs root@10.0.100.119:/ /mnt/pi-ext4
sshfs root@10.0.100.119:/boot /mnt/pi-fat32
```

Install the kernel modules onto the drive:

```
env PATH=$PATH make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=/mnt/pi-ext4 modules_install
```

Copy the kernel and DTBs onto the drive:

```
cp arch/arm64/boot/Image /mnt/pi-fat32/kernel8.img
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

> For 32-bit Pi OS, use `ARCH=arm`, `CROSS_COMPILE=arm-linux-gnueabihf-`, `zImage` instead of `Image`, `kernel7l` instead of `kernel8`, and `arm` instead of `arm64`.

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
sudo cp arch/arm64/boot/Image mnt/fat32/kernel8.img
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
sudo cp arch/arm64/boot/Image mnt/fat32/kernel8.img
sudo cp arch/arm64/boot/dts/broadcom/*.dtb mnt/fat32/
sudo cp arch/arm64/boot/dts/overlays/*.dtb* mnt/fat32/overlays/
sudo cp arch/arm64/boot/dts/overlays/README mnt/fat32/overlays/
```

> For 32-bit Pi OS, use `kernel7l` instead of `kernel8`.

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
