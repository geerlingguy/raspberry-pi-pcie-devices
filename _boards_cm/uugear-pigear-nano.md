---
layout: board
title: "UUGear PiGear Nano"
short_description: CM4 board with 8x USB 3 ports, M.2 NVMe, 4G mini PCIe, industrial IO, and more.
status: prototype
picture: "/images/board-uugear-pigear-nano.jpeg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/365"
link: https://www.uugear.com/product/pigear-nano/
videos:
  - https://www.youtube.com/watch?v=m_P82mFCRQQ
---
There are three VLI USB 3 hubs on this board. One is a VLI VL805 like is found on the Raspberry Pi 4 model B.

There are two additional VLI VL817 chips (USB 3.1 gen 1) that drive all those USB 3 ports on the rear. It also has an M.2 NVMe slot, though that is bridged through a RTL9210 M.2 NVMe to USB adapter. And it has a mini PCIe slot on the topside suitable for 4G LTE modules (with a SIM tray on the underside).

And there's a bevy of IO through a pluggable header, along with a red, yellow, and green LED stack, a gigabit Ethernet port, a USB-C power input, a 2-pin pluggable power input, and a few other bits and bobs that I'm still sorting out.

It has an HDMI port, power and reset buttons, and a microSD card slot, so you can boot Lite CM4 modules from it, as well as a buzzer, a CAM0 and DISP0 CSI and DSI port, and what I'm guessing is the same 14-pin header as is on the CM4 IO board.

For more information and updates on testing, see the [GitHub issue](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/365).
