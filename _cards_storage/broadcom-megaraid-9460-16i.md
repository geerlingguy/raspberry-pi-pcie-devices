---
layout: card
title: "Broadcom MegaRAID 9460-16i storage controller"
picture: "/images/storage-broadcom-megaraid-9460-16i.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/72"
buy_link: https://amzn.to/3arF4O4
videos: []
---
This card currently requires a few minor driver modifications to work on both 32-bit and 64-bit ARM on Raspberry Pi OS.

Driver compilation also requires setting `CONFIG_IRQ_POLL=y` in your kernel `.config` and recompiling the Pi OS kernel.

Once the card is up and running, you can use StorCLI to manage volumes through the storage controller.

For example, you can view all the drives attached to a particular backplane using `storcli64 /c0 show`.

To create a RAID 5 volume with four SATA drives in slots 1-4 in a storage backplane, run:

```
storcli64 /c0 add vd r5 name=SATAR5 drives=97:0-3 pdcache=default AWB ra direct Strip=64
```

I was able to get sustained 400 MB/sec read and write performance using four Kingston SSDs inside an SFF-TA-1005-compliant reference backplane connected to the card via the U.3 (SFF-TA-1001) spec.

That is equavelent to about 3.35 Gbps, which is right at the limit of what the Pi's 1x PCI Express Gen 2.0 lane can handle (and is in line with what I've gotten out of multi-gigabit network cards when testing them to their limits).
