---
layout: card
title: "KingSpec 128GB M.2 2242 NVMe SSD"
picture: "/images/m2-kingspec-m2-nvme-ssd-128gb.jpg"
functionality_cm4: "Full"
functionality_pi5: "Untested"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/92"
buy_link: https://amzn.to/3rnTnJm
videos:
  - https://www.youtube.com/watch?v=m-QSQ24_8LY
---
This NVMe SSD works great with the CM4, assuming you have a compatible M.2 B or B+M key slot.

I tested it in the TOFU carrier board, and was able to get the following benchmark results:

  - fio 1M seq read: 395MiB/s (414MB/s)
  - fio 1M seq write:  381MiB/s (400MB/s)
  - iozone 1M seq read:  369.77 MiB/s
  - iozone 1M seq write: 361.34 MiB/s
  - iozone 4k rand read: 39.57 MiB/s
  - iozone 4k rand write:  88.07 MiB/s

The drive did not seem to get too hot, though it was warm after running the benchmarks, and it fit well in the TOFU.
