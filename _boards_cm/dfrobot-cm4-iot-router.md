---
layout: board
title: "DFRobot IoT Router Carrier Board Mini"
short_description: An open hardware micro-ATX motherboard for the CM4.
status: production
picture: "/images/board-dfrobot-cm4-iot-router.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/114"
link: https://www.dfrobot.com/product-2242.html
videos:
  - https://www.youtube.com/watch?v=w7teLVwi408
---
The IoT Router Board Mini is the smallest two-port dual-gigabit router board for the Compute Module 4. It is a no-frills 2-port gigabit router, with the 2nd port using an RTL8111 network chip on the PCI express bus, meaning you'll have two full gigabit network interfaces.

It is purpose-built for OpenWRT, but can run other distributions and software that is useful in router and switching scenarios. It includes one USB-C High Speed (2.0) port, and one USB-C port to supply power (5V @ 3A max).

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

* Iperf3 test

```
(venv) [myself@Magnuss-MBP-2:~/temp/raspberry/raspiMake (master)]$ iperf3 -c 10.45.0.1
Connecting to host 10.45.0.1, port 5201
[  5] local 10.45.0.110 port 56239 connected to 10.45.0.1 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  92.9 MBytes   779 Mbits/sec                  
[  5]   1.00-2.00   sec   112 MBytes   942 Mbits/sec                  
[  5]   2.00-3.00   sec   112 MBytes   942 Mbits/sec                  
[  5]   3.00-4.00   sec   112 MBytes   941 Mbits/sec                  
[  5]   4.00-5.00   sec   112 MBytes   942 Mbits/sec                  
[  5]   5.00-6.00   sec   112 MBytes   942 Mbits/sec                  
[  5]   6.00-7.00   sec   112 MBytes   942 Mbits/sec                  
[  5]   7.00-8.00   sec  99.3 MBytes   833 Mbits/sec                  
[  5]   8.00-9.00   sec  85.6 MBytes   718 Mbits/sec                  
[  5]   9.00-10.00  sec   108 MBytes   902 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-10.00  sec  1.03 GBytes   888 Mbits/sec                  sender
[  5]   0.00-10.00  sec  1.03 GBytes   887 Mbits/sec                  receiver
```

# References

* https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile
* https://github.com/geerlingguy/raspberry-pi-pcie-devices/blob/master/_cards_network/rosewill-rc20001-25gbe.md
* https://wiki.dfrobot.com/Compute_Module_4_IoT_Router_Board_Mini_SKU_DFR0767
