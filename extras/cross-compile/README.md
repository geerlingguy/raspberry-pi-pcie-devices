# Raspberry Pi Linux Cross-compilation Environment

This environment can be used to [cross-compile the Raspberry Pi OS kernel](https://www.raspberrypi.org/documentation/linux/kernel/building.md) from a Linux, Windows, or Mac workstation using Vagrant and VirtualBox.

Note that on Linux, you're probably better off doing things natively, or in a Docker container, which reduces the overhead of installing VirtualBox.

Plus, Oracle. Yuck.

This build configuration has only been tested with the Raspberry Pi 4, CM4, and Pi 400, and run on macOS.

## Bringing up the VM

  1. Make sure Vagrant, VirtualBox, and the VirtualBox Extension Pack are installed.
  1. Bring up the Vagrant machine that you'll use for compilation: `vagrant up`
  1. Log into the Vagrant machine: `vagrant ssh`

## Attaching a USB card reader device

In order to compile the kernel and copy it into place on a Pi OS image/card, you need to directly attach a USB microSD card reader (or a flash/SSD/whatever drive) to the VirtualBox VM.

You will likely need to install the "VirtualBox Extension Pack", which you can download from the [VirtualBox Downloads](https://www.virtualbox.org/wiki/Downloads) page, then double-click on it to install it.

To do this:

  1. Shut down the Vagrant machine: `vagrant halt`
  1. Open VirtualBox
  1. Go into the Settings for the 'cross-compiler' VM.
  1. Go to Ports > USB
  1. In the 'USB Device Filters' section, add your card reader or drive.

Then restart the VM with `vagrant up`, and log back in with `vagrant ssh`.

Note that if you have an older Mac, you might need to modify the Vagrantfile to use different USB settings. And you could technically configure the device in the Vagrantfile, but since I use at least four different Mac / card reader combinations, I didn't want to hard-code it.

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
     make -j12 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules dtbs
     ```

> For 32-bit Pi OS, use `ARCH=arm`, `CROSS_COMPILE=arm-linux-gnueabihf-`, and `zImage` instead of `Image`.

> I set the jobs argument (`-j12`) based on a bit of benchmarking using different numbers of jobs, settling on the ratio of `floor([vCPU count] * 1.6)`.

## Copying built Kernel via remote SSHFS filesystem

It is most convenient to manage the built modules by copying them over to a running Pi, instead of doing a microSD card swap dance every time you recompile.

One prerequisite for this particular method is to set a `root` password on the Pi and allow root password login (there are other more secure ways... this is for convenience!).

### Configuring Root Password SSH login on the Pi

Logged into the Pi with SSH, run `sudo su`, then `passwd`, and set a password.

Edit the `/etc/ssh/sshd_config`, find the `PermitRootLogin` line, uncomment it, and change the value from `prohibit-password` to `yes`.

Restart SSHD:

```
sudo systemctl restart sshd
```

Now make sure you can SSH into the Pi as `root` from the cross-compile VM, with:

```
ssh root@10.0.100.120
```

### Setting up an SSHFS mount

Set up SSHFS, and mount the Pi's filesystems into the cross-compile environment:

```
sudo apt-get install sshfs
sudo mkdir -p /mnt/pi-ext4
sudo mkdir -p /mnt/pi-fat32
sudo sshfs root@10.0.100.121:/ /mnt/pi-ext4
sudo sshfs root@10.0.100.121:/boot /mnt/pi-fat32
```

Install the kernel modules onto the drive:

```
sudo env PATH=$PATH make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=/mnt/pi-ext4 modules_install
```

Copy the kernel and DTBs onto the drive:

```
sudo cp arch/arm64/boot/Image /mnt/pi-fat32/kernel8.img
sudo cp arch/arm64/boot/dts/broadcom/*.dtb /mnt/pi-fat32/
sudo cp arch/arm64/boot/dts/overlays/*.dtb* /mnt/pi-fat32/overlays/
sudo cp arch/arm64/boot/dts/overlays/README /mnt/pi-fat32/overlays/
```

Unmount the filesystems:

```
sudo umount /mnt/pi-ext4
sudo umount /mnt/pi-fat32
```

Reboot the Pi and _voila!_, you're done!

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
