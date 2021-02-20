---
layout: board
title: "CM4 SATA NAS by mebs_t"
short_description: A small NAS carrier board for 2 SATA drives.
status: prototype
picture: "/images/board-cm4-nas-mebs-t.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/25#issuecomment-735413816"
link: https://github.com/mebs/CM4-NAS/
videos:
  - https://www.youtube.com/watch?v=4vSGl5kpf-k
---
This Compute Module 4 carrier board design exposes a subset of the CM4's interfaces, including its single PCIe gen 2 lane to accept an external SATA controller card. This design is based off of the official Raspberry Pi Foundation's CM4 IO board (the KiCad project is available on the [IO board official page](https://www.raspberrypi.org/products/compute-module-4-io-board/?resellerType=home)). Removed the IO that was less relevant for a NAS and rearranged the remaining interfaces for a smaller footprint that would fit within the width of a standard 3.5" hard drive.
