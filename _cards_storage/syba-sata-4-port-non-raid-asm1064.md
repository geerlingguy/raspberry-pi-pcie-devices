---
layout: card
title: "Syba/IOCrest ASM1064 PCIe SATA 4-port Controller"
picture: "/images/storage-syba-sata-4-port-non-raid-asm1064.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/116"
buy_link: https://amzn.to/3jCMByn
videos: []
---
This SATA controller works well with Raspberry Pi OS and allows attaching 4 SATA devices (powered separately).

It uses the ASMedia 1064 chipset, which may require recompiling the kernel with the `CONFIG_ATA` and `CONFIG_SATA_AHCI` options.
