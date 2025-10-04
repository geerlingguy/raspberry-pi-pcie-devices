---
layout: card
title: "AMD Radeon RX 7900 XT 20GB PCIe x16"
picture: "/images/gpu-radeon-rx7900xt.jpg"
functionality_cm4: "None"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/763"
buy_link: https://amzn.to/46juky9
videos:
  - https://www.youtube.com/live/Q3bY0qHl8gw
---
The Radeon RX 7900 XT ("Navi 31") was released in 2022 and is supported by the open source amdgpu driver in the Linux Kernel.

It requires a physical x16 PCIe socket. You will need to supply 26A of 12V power (about 315W) to the card directly through it's separate 8-pin PCIe power plugs.

### `amdgpu` (open source) driver

To get the amdgpu driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) on the 6.15 branch (`rpi-6.15.y`) or later.

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `amdgpu` driver to install.

Also make sure you have the AMD firmware installed (`sudo apt install -y firmware-amd-graphics`) or the driver will complain about missing files.

The amdgpu driver needs a small patch to work correctly with the Raspberry Pi's PCIe bus; see the linked GitHub issue for more details.
