---
layout: card
title: "AMD Radeon RX 7900 XTX 24GB PCIe x16"
picture: "/images/gpu-radeon-rx7900xtx.png"
functionality_cm4: "None"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/503"
buy_link: https://amzn.to/3W58gyX
videos:
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
---
The Radeon RX 7900 XT ("Navi 31") was released in 2022 and is supported by the open source amdgpu driver in the Linux Kernel, version 6.0 and later. It is also supported by AMD's [Radeon Software for Linux as of the 22.40 version](https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-22-40).

It requires a physical x16 PCIe socket. You will need to supply 26A of 12V power (about 315W) to the card directly through it's separate 8-pin PCIe power plugs.

### `amdgpu` (open source) driver

To get the amdgpu driver and firmware installed, follow the directions in [this blog post](https://www.jeffgeerling.com/blog/2025/using-amd-gpus-on-raspberry-pi-without-recompiling-linux).

See the linked GitHub issue for more details.
