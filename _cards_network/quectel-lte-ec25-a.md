---
layout: card
title: "Quectel EC25-A LTE Cat 4 Mini PCIe Module"
picture: "/images/network-quectel-ec25-a.jpeg"
functionality: "Currently Testing"
driver_required: "Maybe"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/344"
buy_link: https://www.quectel.com/product/lte-ec25-mini-pcie-series
videos: []
---
From the spec sheet:

> Quectel EC25 Mini PCIe is a series of LTE category 4 module adopting standard PCI Express® Mini Card form factor (Mini PCIe). It is optimized specially for M2M and IoT applications, and delivers 150 Mbps downlink and 50 Mbps uplink data rates.

Supposedly it has "USB serial drivers for Windows 7/8/8.1/10, Linux, Android" and some other Pi users have reported success with these models (the EU version).

There's a [tutorial for using cellular modems with the Pi 4](https://www.switchdoc.com/2021/05/tutorial-using-cellular-modems-with-the-raspberry-pi-4b/) that I think should apply equally well for the CM4. We'll see. There's a [more generic tutorial with qmi_wwan here](https://techship.com/faq/how-to-step-by-step-set-up-a-data-connection-over-qmi-interface-using-qmicli-and-in-kernel-driver-qmi-wwan-in-linux/).

I also have a SIM from SixFab, but I will try to see if I can also get an AT&T SIM working later, since I may have a bead on an unlimited data plan for a 'decent-ish' price, which might be nice for a project I want to do.
