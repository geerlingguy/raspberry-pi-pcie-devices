---
layout: card
title: "Syba/IOCrest ASM1064 PCIe SATA 4-port Controller"
picture: "/images/storage-syba-sata-4-port-non-raid-asm1064.jpg"
functionality_cm4: "Full"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/116"
buy_link: https://amzn.to/3jCMByn
videos: []
---
This SATA controller works well with Raspberry Pi OS and allows attaching 4 SATA devices (powered separately). It uses the ASMedia 1064 chipset.

Since mid-2021, [SATA support is built into the Raspberry Pi kernel](https://www.jeffgeerling.com/blog/2021/raspberry-pi-os-now-has-sata-support-built), so assuming you have updated to the latest version (`sudo apt upgrade -y`), this card should work out of the box.
