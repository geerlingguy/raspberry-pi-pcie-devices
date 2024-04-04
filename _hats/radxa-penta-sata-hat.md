---
layout: hat
title: "Radxa Penta SATA HAT"
short_description: A Pi 5 HAT for up to 5 SATA SSDs or HDDs.
status: production
picture: "/images/hat-radxa-penta-sata-hat.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/615"
link: "https://radxa.com/products/accessories/penta-sata-hat/"
videos:
  - https://www.youtube.com/watch?v=l30sADfDiM8
---
This HAT includes four SATA drive connectors, plus one edge connector for a 5th drive, 12V power inputs (molex or barrel jack) to power both the drives and the Pi 5 via GPIO, a cable for the 5th drive, an FFC cable to connect the HAT to the Pi 5, and screws for the mounting.

There's also an 'Expansion interface' with connections for OLED and Fan control, but there is no included adapter for such purposes. So you'd probably want to connect a little fan to the Pi's fan header for the Pi itself, or a USB fan for the drives, if needed.

It looks like the SATA controller is a JMB585 PCIe Gen 3x2 SATA controller, so it benefits from running the Pi 5's PCIe lane at Gen 3.0 speeds.

To use the board at Gen 3.0 speeds, after connecting it to the Pi, you need to add the following lines to `/boot/firmware/config.txt`:

```
dtparam=pciex1
dtparam=pciex1_gen=3
```

I was able to get sequential read speeds around 800-850 MB/sec with an array of four Samsung QVO SSDs set up in RAID 0.
