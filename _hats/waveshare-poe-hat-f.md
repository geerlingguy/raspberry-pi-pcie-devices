---
layout: hat
title: "Waveshare PoE HAT (F) for Pi 5"
short_description: PoE HAT for powering Raspberry Pi 5 via Ethernet
status: production
picture: "/images/hat-waveshare-poe-hat-f.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/597"
link: "https://amzn.to/3vWYrLZ"
videos:
  - https://www.youtube.com/watch?v=OEctB0HOpZ8
  - https://www.youtube.com/watch?v=GYN3ub8Qb_I
---
The Waveshare PoE HAT (F) for Raspberry Pi 5 is a $30 PoE HAT that should power the Raspberry Pi 5 off any PoE or PoE+ network switch/adapter.

It comes with a thin heatsink and three thermal pads, and that heatsink snaps into place using the same mounting holes the Raspberry Pi Active Cooler uses.

While this is not strictly a PCIe HAT, it does have cutouts for both PCIe port access and CSI/DSI connections, which is nice. Plus, I've tested it with Pimoroni's NVMe BASE and found no problems booting off a Kioxia XG6 NVMe SSD. See: [Pi 5 HAT: Pimoroni NVMe Base](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/565).
