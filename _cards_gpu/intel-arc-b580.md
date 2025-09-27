---
layout: card
title: "Intel Arc B580"
picture: "/images/gpu-intel-arc-b580.png"
functionality_cm4: "None"
functionality_pi5: "Some"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/695"
buy_link: https://amzn.to/40UZIy6
videos:
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
---
The Intel Arc B580 is Intel's second generation standalone graphics card, in the 'Battlemage' series. The Xe driver has improved a bit since the first generation 'Archimedes' cards, but is still a little rough.

Physically, it requires a x16 PCIe socket. You will need to supply about 225W to the card directly through it's two 8-pin PCIe power plugs.

### Xe Open Source Driver

To get the i915 driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) on the 6.15 branch (`rpi-6.15.y`) or later.

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `Xe` driver to install.

Before compiling the kernel, run `make menuconfig` and set:

  1. Device Drivers > Graphics support > Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) > Intel Xe Graphics
  1. Device Drivers > Graphics support > Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) > Intel Xe Graphics > Force probe xe for selected Intel hardware IDs > `*` (enter `*` manually for the value)

There are a few other tweaks that need to be made to get this card to output a signal and work with Vulkan, OpenGL, etc. on a Pi.

See the linked GitHub issue for more details.
