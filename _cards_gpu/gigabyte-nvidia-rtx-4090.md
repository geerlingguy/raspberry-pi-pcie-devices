---
layout: card
title: "Gigabyte Nvidia RTX 4090 OC"
picture: "/images/gpu-nvidia-rtx-4090-oc.jpg"
functionality_cm4: "None"
functionality_pi5: "Partial"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/504"
buy_link: https://amzn.to/3KaTN26
videos:
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
---
The Quadro RTX 3060 is supported by both Nvidia's proprietary driver and the open source Nouveau driver in the Linux Kernel.

You need to provide a physical x16 slot, and supplemental PCIe 12-pin power to give the card power (it needs a lot...).

## Driver

Currently the easiest way to get this card working with a Pi 5 is with [mariobalanica's patch to the Nvidia open GPU kernel module driver](https://www.jeffgeerling.com/blog/2025/nvidia-graphics-cards-work-on-pi-5-and-rockchip).

See the linked GitHub issue for more information.
