---
layout: card
title: "Realtek RTL8111 1GBit PCIe x1 on the DF Robot Compute Module 4 IOT Router Cariier Board Mini"
picture: "/images/network-realtek-rtl8111.png"
functionality: "Full"
driver_required: "Yes"
buy_link: https://www.dfrobot.com/product-2242.html
---
This adapter is used onboard the DF Robot's Raspberry Pi Compute Module 4 IoT Router Carrier Board Mini.

It can be made to work with Rasberry OS by compiling a new kernel (built in or as a kernel module).

You can  [cross-compile the Pi OS kernel](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) and use menuconfig to select the right driver to build:

After compiling the kernel and moving it to the Pi, reboot the CM4 module, and the card is identified as `eth1`.

For a 32 bit kernel:

* Prepare for compiling (inside the cross compile container)

```
git clone --depth=1 https://github.com/raspberrypi/linux
cd linux
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2711_defconfig
```

* In the menu config

```
Device Drivers
  > Network device support
    > Ethernet driver support
      > Realtek devices
        > Realtek 8169/8168/8101/8125 ethernet support
```

* Compile the kernel

```
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
make -j8 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs
mkdir -p /mnt/pi-ext4
mkdir -p /mnt/pi-fat32
sshfs root@192.168.4.239:/ /mnt/pi-ext4
sshfs root@192.168.4.239:/boot /mnt/pi-fat32
env PATH=$PATH make -j8 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=/mnt/pi-ext4 modules_install
cp arch/arm/boot/zImage /mnt/pi-fat32/kernel7l.img 
cp arch/arm/boot/dts/overlays/*.dtb* /mnt/pi-fat32/overlays/
cp arch/arm/boot/dts/overlays/*.dtb* /mnt/pi-fat32/overlays/
cp arch/arm/boot/dts/overlays/README /mnt/pi-fat32/overlays/
cp drivers/net/ethernet/realtek/r8169.ko /mnt/pi-ext4/lib/modules/5.10.17-v7l+/kernel/drivers/net/ethernet/realtek/
umount /mnt/pi-ext4
umount /mnt/pi-fat32
```

# References

* https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile
* https://github.com/geerlingguy/raspberry-pi-pcie-devices/blob/master/_cards_network/rosewill-rc20001-25gbe.md