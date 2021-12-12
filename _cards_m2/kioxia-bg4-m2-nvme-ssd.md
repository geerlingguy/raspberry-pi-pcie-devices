---
layout: card
title: "KIOXIA BG4 M.2 NVMe SSD"
picture: "/images/m2-kioxia-bg4-m2-nvme-ssd.jpeg"
functionality: "Full"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/326"
buy_link: https://amzn.to/328pLrz
videos: []
---
[KIOXIA's BG4 M.2 NVMe SSD](https://business.kioxia.com/en-emea/ssd/client-ssd/bg4.html) drive drive is an inexpensive NVMe SSD commonly used in laptops that is mostly available used.

It is an inexpensive SSD that doesn't include any DRM, and relies on a technology called NVMe Host Memory Buffer (HMB) that essentially moves NVMe cache to the system RAM.

Using my [disk-benchmark.sh script](https://raw.githubusercontent.com/geerlingguy/raspberry-pi-dramble/master/setup/benchmarks/disk-benchmark.sh), I got the following performance numbers on the Pi CM4:

| Benchmark | Result |
| --- | --- |
| fio 1M sequential read | 192 MB/s |
| iozone 1M random read | 170 MB/s |
| iozone 1M random write | 157 MB/s |
| iozone 4K random read | 29.71 MB/s |
| iozone 4K random write | 54.50 MB/s |
