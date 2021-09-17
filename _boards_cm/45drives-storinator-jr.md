---
layout: board
title: "45Drives' Storinator Jr"
picture: "/images/board-45drives-storinator-jr.jpg"
functionality: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/252"
buy_link: "https://twitter.com/45Drives/status/1438264868277211137"
videos:
  - https://www.youtube.com/watch?v=A6X9ci8KvgE
---
The [Storinator Jr.](https://www.45drives.com/blog/storage/the-jeff-geerling-inspired-storinator/) includes *16* 2.5" SATA drives, a CM4 on the official IO Board, and an [LSI 9405W-16i HBA](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/196). It is limited to around 400 MiB/sec storage throughput, but since it only has 1 Gbps Ethernet, that's not going to be a bottleneck if you just use it for network storage.

45Drives even compiled in ZFS and did some benchmarking—it wasn't amazingly performant, but it did work :)

To get to production, they would need to do some extra performance validation, change the SSD mounting orientation, and possibly switch to a DC power input jack.
