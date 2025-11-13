---
layout: card
title: "Intel Arc Pro B50"
picture: "/images/gpu-intel-arc-pro-b50.jpg"
functionality_cm4: "None"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/779"
buy_link: https://www.newegg.com/Intel-Arc-Pro-B50-16GB-Workstation-SFF-Graphics-Card/p/N82E16814883007
videos:
  - https://www.youtube.com/watch?v=ewDJpxQEGo4
---
The Intel Arc Pro B50 is Intel's entry level low-profile slot-power-only workstation graphics card.

It's not meant to compete with large dual or triple-slot GPUs with extra power connectors, the goal is to cram in a somewhat efficient and quiet GPU into an SFF PC. Giving 16 GB of VRAM for a $350 price point (at launch) is quite generous, compared to Nvidia's A1000 and AMD's, well... they don't really have a competing two-slot-cooler low-profile card right now.

Physically, it requires a x16 PCIe socket. The card pulls all power from the card slot, so you need to supply up to 70W to the card slot through an eGPU dock or adapter (don't try running it directly off the Pi's PCIe connection).

### Xe Open Source Driver

To get the Xe driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) on the 6.15 branch (`rpi-6.15.y`) or later.

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `Xe` driver to install.

Before compiling the kernel, run `make menuconfig` and set:

  1. Device Drivers > Graphics support > Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) > Intel Xe Graphics
  1. Device Drivers > Graphics support > Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) > Intel Xe Graphics > Force probe xe for selected Intel hardware IDs > `*` (enter `*` manually for the value)

There are a few other tweaks that need to be made to get this card to output a signal and work with Vulkan, OpenGL, etc. on a Pi.

See the linked GitHub issue for more details.
