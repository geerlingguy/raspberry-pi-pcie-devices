---
layout: board
title: "Sipeed NanoCluster"
short_description: Up to 7 nodes in an extremely compact form factor.
status: production
picture: "/images/board-sipeed-nanocluster.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/739"
link: https://sipeed.com/nanocluster
videos: []
---
[Sipeed's NanoCluster](https://sipeed.com/nanocluster) is a tiny cluster board that can hold up to seven Compute Module 4/5 boards using small riser cards. These cards use dual M.2 (NGFF) slots to adapt the compute module pins to the pinout expected on the playing-card-size carrier board.

One end has a large fan for cooling, and the other end has the power and IO. You can power the board via either PoE++ (60W) or through USB-C PD (65W).

Because of the limited power budget and narrow space between boards—especially if you fit NVMe SSDs (the riser cards can hold a 2242 NVMe SSD, and/or microSD)—it's recommended you only run 4 or a maximum of 5 CM5s. CM4s may fit more within that power budget, but I've found 4 is probably the best number if you want to get the best performance.

Slot 1 has power control over the other slots through GPIO, as well as optional UART support to at least some of the other slots. There are also USB and HDMI ports wired to slot 1 for external display and keyboard/accessories.

All nodes are interconnected over 1 Gbps links to a RISC-V switch chip on the underside of the board. That is a managed switch which has a web UI for control over port status, VLANs, etc. (most of the basic controls you'd expect are exposed, though currently only in a Chinese language UI).

Externally, there is a single PoE++-capable 1 Gbps Ethernet link to the outside world. So for storage or high-bandwidth applications, this board has the same challenge/bottleneck there as other boards like the Turing Pi 2 and Super6c.
