---
layout: card
title: "Intel Arc A750 Limited Edition"
picture: "/images/gpu-intel-a750.jpg"
functionality: "None"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/510"
buy_link: https://amzn.to/40UZIy6
videos:
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
---
The Intel Arc A750 Limited Edition is one of Intel's first consumer standalone graphics cards. The driver support for X86 is... okay at best right now. And for ARM64, nonexistent.

Physically, it requires a x16 PCIe socket. You will need to supply about 225W to the card directly through it's 8-pin and 6-pin PCIe power plugs.

### i915 Open Source Driver

To get the i915 driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) on the 6.2 branch (`rpi-6.2.y`) or later.

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `i915` driver to install.

...unfortunately, at this time, that driver only supports X86 systems, so it isn't able to be selected if cross-compiling for ARM.

See the linked GitHub issue for more details.
