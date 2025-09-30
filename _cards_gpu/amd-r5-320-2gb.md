---
layout: card
title: "AMD R5 230 2GB"
picture: "/images/gpu-amd-r5-230.jpeg"
functionality_cm4: "Partial"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/767"
buy_link: https://amzn.to/42OUhTU
videos: []
---
This AMD R5 320 has 2GB of VRAM, uses the Caicos GPU ("Southern Islands"), and was launched in 2014. This card requires a PCIe x16 slot and draws power from the card slot directly.

## Raspberry Pi 5

I was able to get the card working by recompiling the Pi OS kernel with the `radeon` driver, and using yanghaku's 15 line DRM patch to fix some memory consistency bugs.

I also had to switch the graphical environment to X11 instead of labwc using `raspi-config`.

See the linked GitHub issue for more details.
