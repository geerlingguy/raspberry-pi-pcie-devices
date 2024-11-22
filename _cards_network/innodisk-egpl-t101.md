---
layout: card
title: "Innodisk EGPL-T101"
picture: "/images/network-innodisk-egpl-t101.jpg"
functionality_cm4: "Currently Testing"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/364"
buy_link: https://www.innodisk.com/en/products/embedded-peripheral/communication/egpl-t101
videos: []
---
The Innodisk EGPL-T101 is a 10 GbE M.2 adapter in a tiny 2280 form factor. It has an Aquantia chip inside, and is well supported under Linux.

To get it to work with Pi OS, you need to compile a custom Linux kernel following Raspberry Pi's instructions, and select the Aquantia drivers with `make menuconfig` before building:

```
Device Drivers
  > Network device support
    > PHY Device support and infrastructure
      > Aquantia PHYs

Device Drivers
  > Network device support
    > Ethernet driver support
      > aQuantia devices
        > aQuantia AQtion(tm) Support
```

This card gets around 6 Gbps up and down when using PCIe Gen 3 speeds. To enable that speed on a Pi 5, edit `/boot/firmware/config.txt` and add:

```
dtparam=pciex1_gen=3
```

Then reboot your Pi.
