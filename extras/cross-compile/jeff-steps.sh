
# In the cross-compile environment.
make -j12 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules dtbs

mkdir -p mnt/fat32
mkdir -p mnt/ext4
sudo mount /dev/sdb1 mnt/fat32
sudo mount /dev/sdb2 mnt/ext4

sudo env PATH=$PATH make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=mnt/ext4 modules_install

KERNEL=kernel8
sudo cp mnt/fat32/$KERNEL.img mnt/fat32/$KERNEL-backup.img
sudo cp arch/arm64/boot/Image mnt/fat32/$KERNEL.img
sudo cp arch/arm64/boot/dts/broadcom/*.dtb mnt/fat32/
sudo cp arch/arm64/boot/dts/overlays/*.dtb* mnt/fat32/overlays/
sudo cp arch/arm64/boot/dts/overlays/README mnt/fat32/overlays/

sudo umount mnt/fat32
sudo umount mnt/ext4


# On the Pi, to replace the dtb with larger BAR allocation.
dtc -I dts -O dtb ~/test.dts -o ~/test.dtb
sudo mv ~/test.dtb /boot/bcm2711-rpi-cm4.dtb
sudo reboot