---
layout: card
title: "Nvidia RTX 2080 Ti"
picture: "/images/gpu-nvidia-rtx-2080-ti.jpeg"
functionality_cm4: "None"
functionality_pi5: "Partial"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/795"
buy_link: https://amzn.to/4q49dHD
videos: []
---
The RTX 2080 Ti is supported by both Nvidia's proprietary driver and the open source Nouveau driver in the Linux Kernel.

You need to provide a physical x16 slot, and 2x supplemental PCIe 8-pin power to give the card power.

## Driver

Currently the easiest way to get this card working with a Pi 5 is with [mariobalanica's patch to the Nvidia open GPU kernel module driver](https://www.jeffgeerling.com/blog/2025/nvidia-graphics-cards-work-on-pi-5-and-rockchip).

See the linked GitHub issue for more information.
