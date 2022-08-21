---
layout: card
title: "Sangoma Technologies Corp. A10x T1/E1 AFT cards"
picture: "/images/other-sangoma-a108.png"
functionality: "Full (32-bit kernel only)"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/471"
buy_link: https://www.amazon.com/Sangoma-A101E/dp/B001BDI8KY/
videos: []
---

Sangoma is the market leader in supporting reliable SD-WAN failover solutions for large retail organizations over a T1 / E1 internet connection. Sangoma’s world-class A-series T1 / E1 data cards have been dominating the market sector since 1984, being installed into appliances of large vendors and OEMs, supporting some of the largest Point-of-Sale (POS) T1 WAN failover solutions and data applications.

Sangoma’s [SD-WAN failover and data cards](https://www.sangoma.com/telephony-cards/sd-wan/) support transfer rates from 1.544 Mbps to 32,800 Mbps of full duplex data. Our cards are powered  by a powerful driver and API suite providing support for WAN protocols such as CHDLC, Frame Relay, X.25, ATM, PPP, HDLC and MULTILINK.

Choose from 1 port of T1/E1 up to 16 ports all using only one (1) PCI or PCI Express slot.  They are 2U form factors and compatible in virtually all commercial grade hardware and Linux operating systems.

### Installation

This driver only supports 32-bit kernels, and needs the following added to ```boot/config.txt``` in order to support 32-bit DMA:

```
# Force PCIe config to support 32bit DMA addresses at the expense of
# having to bounce buffers.
dtoverlay=pcie-32bit-dma
```

Kernel drivers:

* [Patched driver](https://github.com/hharte/wanpipe-rpi-cm4) with changes to support support the Raspberry Pi CM4 (32-bit kernel only.)
* Original [Wanpipe](https://wiki.freepbx.org/display/DAS/Telephony+Card+Driver+Download) driver from Sangoma.

To compile, run "./Setup dahdi --silent"

### Status

Currently working with [patched driver](https://github.com/hharte/wanpipe-rpi-cm4) on 32-bit kernels only.

Support for 64-bit kernels is unlikely as the driver makes extensive use of non-64-bit aligned bitops functions, which are not supported on ARM processors, and lead to an alignment trap.

