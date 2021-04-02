---
layout: card
title: "IOCrest M.2 to 5 Ports SATA with JMB585"
picture: "/images/storage-iocrest-jmb585-m2-sata.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/85"
buy_link: https://amzn.to/2P26l1c
videos: []
---
This little SATA board is a convenient and compact way to add up to 5 SATA drives to a Raspberry Pi, either via a CM4 carrier board that has a built-in full-size (80mm) M.2 slot, or via a PCI Express x1 to M.2 adapter card.

To use the card, you need to compile in ATA and AHCI support, so when [cross-compiling the kernel](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile), add the following two options to your config:

```
CONFIG_ATA
CONFIG_SATA_AHCI
```
