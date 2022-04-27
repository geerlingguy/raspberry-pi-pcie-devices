---
layout: card
title: "AMD Radeon HD 7470 1GB"
picture: "/images/gpu-radeon-hd-7470.jpg"
functionality: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/430"
buy_link: https://www.amazon.com/DELL-VVYN4-Radeon-HD7470-Video/dp/B014VTU6H2
videos: []
---
Dell's [AMD Radeon HD 7470 1GB]() has 1GB of GDDR5 VRAM, uses the Caicos GPU ("Southern Islands"), and was launched in Jan 2012 (according to [TechPowerUp](https://www.techpowerup.com/gpu-specs/radeon-hd-7470-oem.c299)). Power draw is rated at 27W maximum, which could be an issue if driving it direct off the Pi's PCIe slot without an externally-powered riser.

So far it seems the branch we're working on in [#4](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/4) (mainly by @Coreforge) also works with this card out of the box.

See this card's [GitHub issue](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/430) for more details.
