---
layout: card
title: "AMD Radeon RX 6700 XT 12GB PCIe x16"
picture: "/images/gpu-radeon-rx6700xt.jpeg"
functionality_cm4: "None"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/222"
buy_link: https://amzn.to/3l1K8g7
videos:
  - https://www.youtube.com/live/Q3bY0qHl8gw
  - https://www.youtube.com/watch?v=AyR7iCS7gNI
  - https://www.youtube.com/watch?v=7Qx_bdFSSuc
  - https://www.youtube.com/watch?v=LO7Ip9VbOLY
  - https://www.youtube.com/watch?v=crnEygp4C6g
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
---
The Radeon RX 6700 XT ("Navy Flounder") was released in 2021 and is supported by the open source amdgpu driver in the Linux Kernel.

It will require a 1x to 16x adapter, or some other means of adapting the 16x-sized card pins into the 1x slot on the CM4 IO Board. You will need to supply 20A of 12V power (about 230W) to the card directly through it's separate power plugs.

### `amdgpu` (open source) driver

To get the amdgpu driver and firmware installed, follow the directions in [this blog post](https://www.jeffgeerling.com/blog/2025/using-amd-gpus-on-raspberry-pi-without-recompiling-linux).

See the linked GitHub issue for more details.
