---
layout: card
title: "Nvidia RTX 3060 12GB"
picture: "/images/gpu-nvidia-rtx-3060-12gb.jpg"
functionality_cm4: "None"
functionality_pi5: "Partial"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/790"
buy_link: https://amzn.to/4oXSmVz
videos: []
---
The Quadro RTX 3060 is supported by both Nvidia's proprietary driver and the open source Nouveau driver in the Linux Kernel.

You need to provide a physical x16 slot, and supplemental PCIe 8-pin power to give the card power.

## Driver

Currently the easiest way to get this card working with a Pi 5 is with [mariobalanica's patch to the Nvidia open GPU kernel module driver](https://www.jeffgeerling.com/blog/2025/nvidia-graphics-cards-work-on-pi-5-and-rockchip).

See the linked GitHub issue for more information.
