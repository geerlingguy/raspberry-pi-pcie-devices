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

You can  [cross-compile the Pi OS kernel](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) and use `menuconfig` to select the right driver to build:

```
Device Drivers
  > Network device support
    > Ethernet driver support
      > Realtek devices
        > Realtek 8169/8168/8101/8125 ethernet support
```

Check out [DFRobot's documentation](https://wiki.dfrobot.com/Compute_Module_4_IoT_Router_Board_Mini_SKU_DFR0767) on the board.

You can also compile your own OpenWRT image specific to this board following instructions like [these instructions from GitHub user martin-niklasson](https://gist.github.com/martin-niklasson/6912a7e5ba49b92801d54766f1d7277a).
