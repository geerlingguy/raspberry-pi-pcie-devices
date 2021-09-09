---
layout: card
title: "Broadcom MegaRAID 9405W-16i storage controller (LSI)"
picture: "/images/storage-broadcom-megaraid-9405w-16i.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/196"
buy_link: https://amzn.to/3srcZOh
videos: []
---
This card is similar to the [9460-16i](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/72), and is new enough to be supported on ARM platforms by the in-tree `mpt3sas` driver.

Joshua Boudreau, from 45Drives, used this card in a special 'Storinator Jr' build, and used a 45Drives fork of the linux kernel to build in the driver for the card; see [this GitHub comment](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/196#issuecomment-904656864) for details.

On 64-bit Pi OS, Josh had to remove `quiet` from the `/boot/cmdline.txt` configuration in order for the card to work. No clue why!
