---
layout: card
title: "Digium, Inc. Wildcard TE420 quad-span T1/E1/J1 card 3.3V (PCI-Express) (5th gen)"
picture: "/images/other-digium-te420.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/469"
buy_link: https://dcomcomputers.com/digium-te420-quad-t1-e1-pcie-card.html
videos: []
---
The Digium TE420 card was designed for use with Asterisk, Switchvox, and FreePBX; providing up to 120 channels of voice and data, the Digium TE420 card has four standard RJ-45 ports. The Digium TE420 can provide four T1, E1, or J1 interfaces and support 96 T1/J1 or 120 E1 connections.

DIGIUM TE420 FEATURES:
* Supports up to 120 Channels
* Four RJ-45 Ports
* Four T1, E1, or J1 Interfaces
* Status Indicator Lights

### Installation Notes

Add the following to ```boot/config.txt```:

```
# Force PCIe config to support 32bit DMA addresses at the expense of
# having to bounce buffers.
dtoverlay=pcie-32bit-dma
```

Kernel driver: [Installing DAHDI](https://support.digium.com/s/article/Installing-DAHDI)

