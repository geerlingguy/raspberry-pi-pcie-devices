---
layout: card
title: "VisionTek AMD Radeon 5450 1GB PCIe x16"
picture: "/images/gpu-visiontek-radeon-5450.jpg"
functionality: "Partial"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/4"
buy_link: https://amzn.to/2Hh6KcI
videos:
  - https://www.youtube.com/watch?v=ikpgZu6kLKE
---
This graphics card needs [x1 to x16 powered adapter](https://amzn.to/3dZQM2u). The `radeon` driver for this card requires a kernel recompile, and the card is too old to be compatible with the `amdgpu` drivers.

So far GitHub user [Coreforge](https://github.com/Coreforge) has been able to get the card to display terminal output in color, but has had trouble with any kind of GPU acceleration. The required modificiations are in the [gpu-debug-5.10.y branch](https://github.com/Coreforge/linux/tree/gpu-debug-5.10.y) in Coreforge's fork of the Raspberry Pi Linux kernel repository.

See linked GitHub issue for more details and progress getting the card working.
