#!/bin/bash
#
# This file should be located at /usr/local/bin/copykernel
#
# The script should also accept environment variables for things that should be
# parameterized (like the Pi's IP address, `kernel8`, etc.). But I'm using it
# for myself right now, so I do what I want.

# Bail on errors
set -e

PI_ADDRESS="${PI_ADDRESS:-10.0.100.127}"

# Mount Pi volumes locally (requires key authentication).
# 1. Create key inside container: `ssh-keygen -t ed25519 -C "build-container"`
# 2. Add key to Pi (run as root on Pi):
#    `mkdir -p /root/.ssh && echo 'KEY_HERE' >> /root/.ssh/authorized_keys`
printf "Mounting Pi volumes\n"
mkdir -p /mnt/pi-ext4
mkdir -p /mnt/pi-fat32
sshfs root@$PI_ADDRESS:/ /mnt/pi-ext4
sshfs root@$PI_ADDRESS:/boot /mnt/pi-fat32

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

# Reboot the Pi.
ssh root@$PI_ADDRESS 'sudo reboot'
