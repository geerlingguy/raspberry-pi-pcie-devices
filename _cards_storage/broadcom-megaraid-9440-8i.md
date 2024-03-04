---
layout: card
title: "Broadcom MegaRAID 9440-8i storage adapter (LSI)"
picture: "/images/storage-broadcom-megaraid-9440-8i.jpg"
functionality_cm4: "Full"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/250"
buy_link: https://amzn.to/3h03qAV
videos: []
---
This card is similar to the [9460-16i](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/72), and is new enough to be supported on ARM platforms by the in-tree `mpt3sas` driver.

To use this card on the Compute Module 4, you need to apply [this patch](https://github.com/geerlingguy/linux/pull/4) to the `mpt3sas` driver and recompile the Linux kernel. You can then use `storcli` (download from Broadcom's website) to manage the storage controller.

To use this card on the Raspberry Pi 5, please see [this comment from usagidude](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/604#issuecomment-1950885517) for how he got it working.

On 64-bit Pi OS, there's a kernel panic if you have the `quiet` option in your `/boot/cmdline.txt` configuration.
