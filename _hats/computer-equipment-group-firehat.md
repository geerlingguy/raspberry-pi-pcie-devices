---
layout: hat
title: "Computer Equipment Group Firehat"
short_description: A Firewire HAT for recording video from DV cameras with IEEE 1394.
status: prototype
picture: "/images/hat-computer-equipment-group-firehat.jpeg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/805"
link: https://equip-1.c-e.group
videos: []
---
The Firehat is part of the 'equip-1', a portable MRU, or Memory Recording Unit. You can use this HAT's FireWire (IEEE 1394) interface to ingest footage either played back via tape (e.g. MiniDV) or directly through a camera as an input.

It records using `dvgrab` (`sudo apt install -y dvgrab`), and requires the `CONFIG_FIREWIRE_OHCI` option in the Linux kernel.

## Pi Setup

### Recompile the Linux Kernel with Firewire support

[Recompile the Linux kernel](https://www.jeffgeerling.com/blog/2025/how-recompile-linux-on-raspberry-pi/), enabling the following features:

  - `CONFIG_FIREWIRE` (Device Drivers -> IEEE 1394 (FireWire) support -> FireWire driver stack)
  - `CONFIG_FIREWIRE_OHCI` (Device Drivers -> IEEE 1394 (FireWire) support -> FireWire driver stack -> OHCI-1394 controllers)

### Configure Pi Boot options

At the end of `/boot/firmware/config.txt`, under `[all]`, add:

```
dtparam=pciex1
dtoverlay=pcie-32bit-dma
```

At the end of the line in `/boot/firmware/cmdline.txt`, add:

```
pcie_aspm=off
```

## Equip-1 Setup

The OLED display and buttons use the Pi's GPIO to display status information and start/stop recordings directly. You need to install additional software to get them to work.

See the [equip-1 GitHub project](https://github.com/computerequipmentgroup/equip-1/blob/main/os/os.py) or this HAT's linked GitHub issue for more info.
