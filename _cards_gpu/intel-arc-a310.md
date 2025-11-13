---
layout: card
title: "Intel Arc A310 ECO"
picture: "/images/gpu-intel-arc-a310.jpeg"
functionality_cm4: "None"
functionality_pi5: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/778"
buy_link: https://amzn.to/4mWEDgm
videos:
  - https://www.youtube.com/watch?v=ewDJpxQEGo4
---
The Intel Arc A310 ECO is the cheapest of Intel's Arc graphics cards.

Physically, it requires a x16 PCIe socket. The card pulls all power from the card slot, so you need to supply up to 70W to the card slot through an external adapter (don't try running it directly off the Pi's PCIe connection).

### Xe Open Source Driver

To get the Xe driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) on the 6.15 branch (`rpi-6.15.y`) or later.

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `Xe` driver to install.

Before compiling the kernel, run `make menuconfig` and set:

  1. Device Drivers > Graphics support > Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) > Intel Xe Graphics
  1. Device Drivers > Graphics support > Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) > Intel Xe Graphics > Force probe xe for selected Intel hardware IDs > `*` (enter `*` manually for the value)

There are a few other tweaks that need to be made to get this card to output a signal and work with Vulkan, OpenGL, etc. on a Pi.

See the linked GitHub issue for more details.
