---
layout: card
title: "IOCrest JMB582 PCIe Gen3 SATA Controller"
picture: "/images/storage-iocrest-sata-2-port-jmb582.jpg"
functionality: "None"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/64"
buy_link: https://amzn.to/3tmBsUU
videos: []
---
Multiple people have tried getting this card working. It requires AHCI SATA support to be enabled in the kernel, which may require a recompile with the following options added via `menuconfig`:

```
Device Drivers
  > Serial ATA and Parallel ATA drivers (libata) (enable this - M)
    > AHCI SATA support (enable this - M)
    > Marvell SATA support (enable this - M)
```

However, once the kernel module is installed, the Pi kernel panics any time the controller is initialized; see the linked GitHub issue for more details.
