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

Since mid-2021, [SATA support is built into the Raspberry Pi kernel](https://www.jeffgeerling.com/blog/2021/raspberry-pi-os-now-has-sata-support-built), so assuming you have updated to the latest version (`sudo apt upgrade -y`), this card should work out of the box.
