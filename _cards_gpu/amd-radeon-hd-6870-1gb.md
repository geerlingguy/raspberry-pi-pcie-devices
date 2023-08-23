---
layout: card
title: "AMD Radeon HD 6870 1GB"
picture: "/images/gpu-radeon-hd-6870.jpg"
functionality: "Partial"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/543"
buy_link: "https://www.ebay.ie/itm/334733929131"
videos: []
---

Check the twitter video [here](https://twitter.com/qiuyinsen/status/1693954960889720850)

The Radeon HD 6870 was a performance-segment graphics card by AMD, launched on October 21st, 2010. Built on the 40 nm process, and based on the Barts graphics processor, in its Barts XT variant, the card supports DirectX 11.2.  (according to [TechPowerUp](https://www.techpowerup.com/gpu-specs/radeon-hd-6870.c256)). TDP is 151 W, I used a Great Wall 550W 80plus PSU.The GPU needs 12 pins(6+6 pins) power calbe.The PCI-E x1 to PCI-E x16 riser also need a SATA power cable.

I wrote a guide for this,check [here](https://gist.github.com/MartinRGB/67706045e3c485cce757b418bed59736)

Note that the driver doesn't seem quite stable yet, and many features of the card are not accessible.

- LXDE is in software-rendering
- WebGL is not work

See linked GitHub issue for more details and progress getting the card working.
