---
layout: hat
title: "Pimoroni NVMe Base Duo"
short_description: Dual-NVMe Base for Raspberry Pi 5
status: prototype
picture: "/images/hat-pimoroni-nvme-base-duo.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/609"
link: "https://shop.pimoroni.com/products/nvme-base-duo-for-raspberry-pi-5"
videos:
  - https://www.youtube.com/watch?v=GYN3ub8Qb_I
---
Pimoroni's NVMe Base Duo bridges two NVMe M.2 E-key slots (2280/2260/2242/2230) into the single Pi 5 PCIe port, using an ASMedia ASM1182e PCIe Gen 2.0 switch.

Unlike the single NVMe Base, this board's included PCIe adapter cable is straight.

Until the issue [Can't boot Pi 5 via NVMe behind PCIe switch / bridge](https://github.com/raspberrypi/firmware/issues/1833) is resolved, you can use two NVMe SSDs (or other M-key devices), but you will not be able to boot directly off of either slot.
