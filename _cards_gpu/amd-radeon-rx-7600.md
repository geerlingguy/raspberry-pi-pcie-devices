---
layout: card
title: "AMD Radeon RX 7600"
picture: "/images/gpu-amd-radeon-rx-7600.jpeg"
functionality_cm4: "None"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/684"
buy_link: https://amzn.to/3OboSn4
videos:
  - https://www.youtube.com/watch?v=AyR7iCS7gNI
---
The Radeon RX 7600 is a low-end graphics card supported by the open source `amdgpu` driver in the Linux Kernel.

It requires a 16x PCIe card slot. You will need to supply power to the card directly through a 1x8-Pin PCIe power cable.

### `amdgpu` (open source) driver

To get the amdgpu driver and firmware installed, follow the directions in [this blog post](https://www.jeffgeerling.com/blog/2025/using-amd-gpus-on-raspberry-pi-without-recompiling-linux).

See the linked GitHub issue for more details.
