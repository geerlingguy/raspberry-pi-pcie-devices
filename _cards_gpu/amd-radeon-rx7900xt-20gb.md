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

To get the amdgpu driver and firmware installed, follow the directions in [this blog post](https://www.jeffgeerling.com/blog/2025/using-amd-gpus-on-raspberry-pi-without-recompiling-linux).

See the linked GitHub issue for more details.
