---
layout: card
title: "Broadcom MegaRAID 9405W-16i storage controller (LSI)"
picture: "/images/storage-broadcom-megaraid-9405w-16i.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/196"
buy_link: https://amzn.to/3srcZOh
videos:
  - https://www.youtube.com/watch?v=R2S2RMNv7OU
  - https://www.youtube.com/watch?v=BBnomwpF_uY
  - https://www.youtube.com/watch?v=A6X9ci8KvgE
---
This card is similar to the [9460-16i](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/72), and is new enough to be supported on ARM platforms by the in-tree `mpt3sas` driver.

Joshua Boudreau, from 45Drives, used this card in a special 'Storinator Jr' build, and used a 45Drives fork of the linux kernel to build in the driver for the card; see [this GitHub comment](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/196#issuecomment-904656864) for details.

To use this card, you need to apply [this patch](https://github.com/geerlingguy/linux/pull/4) to the `mpt3sas` driver and recompile the Linux kernel. You can then use `storcli` (download from Broadcom's website) to manage the storage controller.

On 64-bit Pi OS, there's a kernel panic if you have the `quiet` option in your `/boot/cmdline.txt` configuration.
