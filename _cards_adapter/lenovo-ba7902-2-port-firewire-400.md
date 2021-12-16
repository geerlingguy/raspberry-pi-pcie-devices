---
layout: card
title: "I/O Crest SI-PEX60016 1 to 2 Port PCIe Switch"
picture: "/images/adapter-lenovo-ba7902.jpg"
functionality: "None"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/113"
buy_link: https://www.ebay.com/itm/304020563817
videos: []
---
This firewire card uses the `firewire_ohci` kernel module:

```
$ lspci -vvv
01:00.0 FireWire (IEEE 1394): VIA Technologies, Inc. VT6315 Series Firewire Controller (rev 01) (prog-if 10 [OHCI])
  Subsystem: Bitland(ShenZhen) Information Technology Co., Ltd. VT6315 Series Firewire Controller
  Device tree node: /sys/firmware/devicetree/base/scb/pcie@7d500000/pci@0,0/usb@0,0
  Flags: fast devsel, IRQ 67
  Memory at 600000000 (64-bit, non-prefetchable) [size=2K]
  I/O ports at <unassigned> [disabled]
  Capabilities: [50] Power Management version 3
  Capabilities: [80] MSI: Enable- Count=1/1 Maskable+ 64bit+
  Capabilities: [98] Express Endpoint, MSI 00
  Capabilities: [100] Advanced Error Reporting
  Capabilities: [130] Device Serial Number 00-11-06-ff-ff-00-87-fb
  Kernel modules: firewire_ohci
```

However, when the Pi boots, it seems the driver can't properly initialize the card:

```
$ dmesg
[    6.125780] firewire_ohci 0000:01:00.0: enabling device (0000 -> 0002)
[    6.125923] firewire_ohci: probe of 0000:01:00.0 failed with error -12
```
