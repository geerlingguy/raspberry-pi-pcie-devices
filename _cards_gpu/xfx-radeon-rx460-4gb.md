---
layout: card
title: "XFX AMD Radeon RX 460 4GB PCIe x16"
picture: "/images/gpu-xfx-radeon-rx460-4gb.jpg"
functionality_cm4: "None"
functionality_pi5: "Yes"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/564"
buy_link: https://amzn.to/3SUkT1R
videos:
  - https://www.youtube.com/watch?v=BLg-1w2QayU
  - https://www.youtube.com/watch?v=EAlrCFJZlnI
---
The Radeon RX 460 is a slightly older graphics card that is supported by the open source amdgpu driver in the Linux Kernel.

It requires a PCIe x16 connection to the Pi 5, so you will need to fabricate one yourself (for the time being). You should also supply _at least_ 5A of 12V power to the x16 slot. You'll also need to provide a separate PCIe power connection (6-pin) to the top of the card.

### `amdgpu` (open source) driver

To get the amdgpu driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile).

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `amdgpu` driver to install.

Also make sure you have the AMD firmware installed (`sudo apt install -y firmware-amd-graphics`) or the driver will complain about missing files.

For the time being, to get this card working, you need to apply [this patch](https://github.com/geerlingguy/linux/pull/8) maintained in Coreforge's Pi OS Linux fork.

For full speed, you should also [force PCIe Gen 3 speed on the PCIe bus](https://www.jeffgeerling.com/blog/2023/forcing-pci-express-gen-30-speeds-on-pi-5).

See the linked GitHub issue for more details.
