---
layout: card
title: "AMD Radeon RX 9070 XT"
picture: "/images/gpu-amd-rx-9070-xt.jpg"
functionality_cm4: "None"
functionality_pi5: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/766"
buy_link: https://amzn.to/4pNiDao
videos:
  - https://www.youtube.com/live/Q3bY0qHl8gw
---
The Radeon RX 9060 XT is a midrange graphics card supported by the open source `amdgpu` driver in the Linux Kernel.

It requires a 16x PCIe card slot. You will need to supply power to the card directly through a PCIe power plug.

### `amdgpu` (open source) driver

To get the amdgpu driver and firmware installed, follow the directions in [this blog post](https://www.jeffgeerling.com/blog/2025/using-amd-gpus-on-raspberry-pi-without-recompiling-linux).

See the linked GitHub issue for more details.
