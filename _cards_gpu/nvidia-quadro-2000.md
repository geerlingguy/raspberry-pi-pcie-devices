---
layout: card
title: "Nvidia Quadro 2000"
picture: "/images/gpu-nvidia-quadro-2000.jpg"
functionality_cm4: "None"
functionality_pi5: "None"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/526"
buy_link: https://amzn.to/3GHk2dK
videos: []
---
This HP version of the Nvidia Quadro 2000 has 1 GB of VRAM and came from one of the streaming PCs in the lab at Bishop DuBourg high school.

Nvidia didn't support this card on any Arm platforms when it was made, and the Linux built-in `nouveau` kernel driver fails with memory access errors.

See the linked GitHub issue for more details.
