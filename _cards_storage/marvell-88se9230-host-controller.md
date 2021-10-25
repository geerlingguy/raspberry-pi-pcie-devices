---
layout: card
title: "Marvell 88SE9230 Host Controller"
picture: "/images/storage-marvell-88se9230.jpg"
functionality: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/284"
buy_link: https://amzn.to/3CglHTk
videos: []
---
The Marvell 88SE9 is the successor to the 88se9130, with 2x PCIe 2.0 lanes and SATA III. It features Marvell's "Hyperduo" feature set that allows SSDs to act as caches for HDDs, as well as striping, mirroring or RAID 10. TRIM is supported along with port multipliers. Apparently the card will even do disk encryption with a modified ROM.

Like the enterprise RAID cards Jeff has talked about, this chip helps the Pi not be bogged down with software RAID like it does with the JMB585 card, for example. I'm getting good Samba file sharing performance with lots of CPU headroom to keep the Pi snappy and spare bus bandwidth to write files locally.

A tiny m.2 version is available. It is wider than most m.2 cards and requires a riser to fit onto many boards.

Check the [GitHub issue](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/284) to follow testing progress.
