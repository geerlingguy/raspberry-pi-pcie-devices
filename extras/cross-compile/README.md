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
     KERNEL=kernel8
     make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcm2711_defconfig
     ```

  1. (Optionally) Either edit the .config file by hand or use menuconfig:

     ```
     make menuconfig
     ```

  1. Compile the Kernel:

     ```
     make -j4 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules dtbs
     ```

> For 32-bit Pi OS, use `KERNEL=kernel7l`, `ARCH=arm`, `CROSS_COMPILE=arm-linux-gnueabihf-`, and `zImage` instead of `Image`.

## Mounting the Pi microSD or USB drive

Mount the FAT and ext4 partitions of the USB card to the system. First, insert your microSD card into the reader you attached to the VM earlier, then run the following commands:

```
mkdir -p mnt/fat32
mkdir -p mnt/ext4
sudo mount /dev/sdb1 mnt/fat32
sudo mount /dev/sdb2 mnt/ext4
```

## Installing modules and copying the built Kernel

Install the kernel modules onto the drive:

```
sudo env PATH=$PATH make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=mnt/ext4 modules_install
```

> For 32-bit Pi OS, use `sudo env PATH=$PATH make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=mnt/ext4 modules_install`

Copy the kernel and DTBs onto the drive:

```
sudo cp mnt/fat32/$KERNEL.img mnt/fat32/$KERNEL-backup.img
sudo cp arch/arm64/boot/Image mnt/fat32/$KERNEL.img
sudo cp arch/arm64/boot/dts/broadcom/*.dtb mnt/fat32/
sudo cp arch/arm64/boot/dts/overlays/*.dtb* mnt/fat32/overlays/
sudo cp arch/arm64/boot/dts/overlays/README mnt/fat32/overlays/
```

## Unmounting the drive

Unmount the disk before you remove it from the card reader or unplug it.

```
sudo umount mnt/fat32
sudo umount mnt/ext4
```
