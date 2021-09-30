---
layout: card
title: "Realtek RTL8111 1GBit PCIe x1 on the DF Robot Compute Module 4 IOT Router Cariier Board Mini"
picture: "/images/network-realtek-rtl8111.png"
functionality: "Full"
driver_required: "Yes"
buy_link: https://www.dfrobot.com/product-2242.html
---
This adapter is used onboard the DF Robot's Raspberry Pi Compute Module 4 IoT Router Carrier Board Mini.

In the current (2021-09-30) Raspberry OS, the NIC is visible on the PCIe bus, but apparently needs a driver that is not shipped with the OS.

```
pi@raspberrypi:~ $ sudo lspci
00:00.0 PCI bridge: Broadcom Limited Device 2711 (rev 20)
01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 15)
pi@raspberrypi:~ $ ip a sho eth1
Device "eth1" does not exist.
pi@raspberrypi:~ $ lsmod | grep r8169 | wc -l
0
```

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

* After rebooting the CM4 module

```
pi@raspberrypi:~ $ uname -a
Linux raspberrypi 5.10.63-v7l+ #2 SMP Thu Sep 30 06:50:24 UTC 2021 armv7l GNU/Linux
pi@raspberrypi:~ $ lsmod | grep r8169
r8169                  81920  0
pi@raspberrypi:~ $ ip a sho eth1
3: eth1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000
    link/ether ca:93:b9:47:a9:ce brd ff:ff:ff:ff:ff:ff
```

# References

* https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile
* https://github.com/geerlingguy/raspberry-pi-pcie-devices/blob/master/_cards_network/rosewill-rc20001-25gbe.md