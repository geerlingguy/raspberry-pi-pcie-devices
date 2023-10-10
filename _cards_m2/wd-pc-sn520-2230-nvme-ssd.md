---
layout: card
title: "WD PC SN520 NVMe M.2 2230 SSD"
picture: "/images/m2-wd-pc-sn520-2230-nvme-ssd.jpg"
functionality_cm4: "Full"
functionality_pi5: "Untested"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/90"
buy_link: https://amzn.to/2MrmvA7
videos:
  - https://www.youtube.com/watch?v=m-QSQ24_8LY
  - https://www.youtube.com/watch?v=AoNxDe1a-X8
---
This NVMe SSD works great with the CM4, assuming you have a compatible M.2 B or B+M key slot.

I tested it in the TOFU carrier board (which only had a standoff at 42mm, so I had to hold it down with Kapton tape), and was able to get the following benchmark results:

  - fio 1M seq read: 398MiB/s (417MB/s)
  - iozone 1M seq read:  363.16 MiB/s
  - iozone 1M seq write: 377.64 MiB/s
  - iozone 4k rand read: 35.50 MiB/s
  - iozone 4k rand write:  82.06 MiB/s

The drive did not seem to get very hot at all.

I also tested the drive in an A+E to M-key adapter in a 12x PCIe M.2 slot carrier board, and it worked great there too (I set up three drives in various RAID configurations using `mdadm`).
