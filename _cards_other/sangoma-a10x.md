---
layout: card
title: "Sangoma Technologies Corp. A10x T1/E1 AFT cards"
picture: "/images/other-sangoma-a108.png"
functionality: "Not working"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/471"
buy_link: https://www.amazon.com/Sangoma-A101E/dp/B001BDI8KY/
videos: []
---

Sangoma is the market leader in supporting reliable SD-WAN failover solutions for large retail organizations over a T1 / E1 internet connection. Sangoma’s world-class A-series T1 / E1 data cards have been dominating the market sector since 1984, being installed into appliances of large vendors and OEMs, supporting some of the largest Point-of-Sale (POS) T1 WAN failover solutions and data applications.

Sangoma’s [SD-WAN failover and data cards](https://www.sangoma.com/telephony-cards/sd-wan/) support transfer rates from 1.544 Mbps to 32,800 Mbps of full duplex data. Our cards are powered  by a powerful driver and API suite providing support for WAN protocols such as CHDLC, Frame Relay, X.25, ATM, PPP, HDLC and MULTILINK.

Choose from 1 port of T1/E1 up to 16 ports all using only one (1) PCI or PCI Express slot.  They are 2U form factors and compatible in virtually all commercial grade hardware and Linux operating systems.

### Installation

Kernel driver: [Wanpipe](https://wiki.freepbx.org/display/DAS/Telephony+Card+Driver+Download)

Needs some changes for ARM.

To compile, run "./Setup dahdi --silent"

### Status

Not currently working, due to attempt to use IRQ 255.
