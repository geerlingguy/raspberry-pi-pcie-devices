#!/bin/bash
#
# TODO: This file should be copied into the cross-compile environment as part
# of the Dockerfile build process at /usr/local/bin/copykernel
#
# The script should also accept environment variables for things that should be
# parameterized (like the Pi's IP address, `kernel8`, etc.). But I'm using it
# for myself right now, so I do what I want.

# Bail on errors
set -e

# Mount Pi volumes locally (requires key authentication).
printf "Mounting Pi volumes\n"
mkdir -p /mnt/pi-ext4
mkdir -p /mnt/pi-fat32
sshfs root@10.0.100.119:/ /mnt/pi-ext4
sshfs root@10.0.100.119:/boot /mnt/pi-fat32

# Install kernel modules.
printf "Installing kernel modules\n"
env PATH=$PATH make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=/mnt/pi-ext4 modules_install

# Copy kernel and DTBs to Pi.
printf "Copying kernel and DTBs\n"
cp arch/arm64/boot/Image /mnt/pi-fat32/kernel8.img
cp arch/arm64/boot/dts/broadcom/*.dtb /mnt/pi-fat32/
cp arch/arm64/boot/dts/overlays/*.dtb* /mnt/pi-fat32/overlays/
cp arch/arm64/boot/dts/overlays/README /mnt/pi-fat32/overlays/

# Unmount Pi volumes.
printf "Cleaning up\n"
umount /mnt/pi-ext4
umount /mnt/pi-fat32
