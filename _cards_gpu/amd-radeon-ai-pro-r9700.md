---
layout: card
title: "AMD Radeon AI Pro R9700"
picture: "/images/gpu-amd-radeon-ai-pro-r9700.png"
functionality_cm4: "None"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/785"
buy_link: https://amzn.to/4r1coAA
videos: []
---
The Radeon AI Pro 9700 was released in 2025 and is supported by the open source `amdgpu` driver in the Linux Kernel.

It requires a 16x PCIe card slot. You will need to supply 300W of power to the card directly through a 12V-2x6 PCIe power cable.

### `amdgpu` (open source) driver

To get the amdgpu driver and firmware installed, follow the directions in [this blog post](https://www.jeffgeerling.com/blog/2025/using-amd-gpus-on-raspberry-pi-without-recompiling-linux).

See the linked GitHub issue for more details.
