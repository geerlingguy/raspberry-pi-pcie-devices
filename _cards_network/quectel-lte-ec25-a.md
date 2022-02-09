---
layout: card
title: "Quectel EC25-A LTE Cat 4 Mini PCIe Module"
picture: "/images/network-quectel-ec25-a.jpeg"
functionality: "Full"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/344"
buy_link: https://amzn.to/3A9xXoJ
videos:
  - https://www.youtube.com/watch?v=OLRldZjty_s
---
From the spec sheet:

> Quectel EC25 Mini PCIe is a series of LTE category 4 module adopting standard PCI Express Mini Card form factor (Mini PCIe). It is optimized specially for M2M and IoT applications, and delivers 150 Mbps downlink and 50 Mbps uplink data rates.

It supports Windows 7/8/8.1/10/11, Linux, Android, and many Pi users have reported success with these models.

I bought an EC25-A, since I'm using AT&T wireless in North America. The -AF variant would work as well, but make sure you buy the variant you need for the networks in your geographical region.

To use the card with a Raspberry Pi, you either need a USB to mini PCIe adapter with a built-in SIM tray (which works with any Pi with a USB port), or a CM4 carrier board with a mini PCIe slot with USB data lines attached, and a SIM tray.

I set the card into ECM (Ethernet Control Model) mode [following SixFab's instructions](https://docs.sixfab.com/page/internet-connection-with-quectel-ec25-by-using-ecm-mode), and could communicate with it over USB using minicom:

```
$ sudo apt install -y minicom
$ minicom -D /dev/ttyUSB2 -b 115200
```

You can use AT commands (see an [AT command guide here](https://www.engineersgarage.com/at-commands-gsm-at-command-set/)) to communicate with the modem. Once it's successfully configured in ECM mode, you should see a `usb0` interface when running `ip a`. That interface will connect through to whatever LTE network your SIM card supports.

I tested with a SixFab SIM on AT&T's network, as well as an AT&T SIM from my iPhone, and both connected successfully, giving me around 10-12 Mbps in both directions.
