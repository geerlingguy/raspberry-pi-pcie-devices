---
layout: card
title: "KIOXIA XG6 M.2 NVMe SSD"
picture: "/images/m2-kioxia-xg6-m2-nvme-ssd.jpeg"
functionality: "Full"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/325"
buy_link: https://amzn.to/3wZEbFP
videos: []
---
I received four [KIOXIA XG6 M.2 NVMe SSD](https://business.kioxia.com/en-us/ssd/client-ssd/xg6.html) drives for testing in a clustered storage scenario. In individual testing on a couple different boards, the XG6 had no problem working with the CM4.

I tested it with `fio` and `iozone`, and comprehensive benchmarks are available in [this GitHub issue](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/325).

But generally, I could get 418 MB/sec in sequential large-block reads, 350-370 MB/sec for 1M random reads/writes, and 40-80 MB/sec for 4K random reads/writes.
