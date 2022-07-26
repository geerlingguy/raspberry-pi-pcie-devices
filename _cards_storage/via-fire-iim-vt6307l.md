---
layout: card
title: "VIA Fire IIM VT6307L FireWire host controller"
picture: "/images/storage-vt6307l.jpg"
functionality: "Currently Testing"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/443"
buy_link: https://www.viatech.com/en/silicon/legacy/peripherals/ieee-1394/vt6307ls/
videos: []
---
GitHub user @WACOMalt was able to get a Generic VT6307L / ASM1083 2+1 IEEE 1394 Firewire PCIe card working on the Compute Module 4.

He compiled the kernel with `firewire-ohci` enabled, and added `dtoverlay=pcie-32bit-dma` to `/boot/config.txt`, and was able to get DVGrab to capture footage live and from tapes.

He did report trouble initializing the camera shortly after boot, and said his only concern was reliability—there were a few dropped frames or failed initializations.

See the [GitHub issue](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/443) for more information and updates.
