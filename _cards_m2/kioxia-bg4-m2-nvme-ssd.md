---
layout: card
title: "KIOXIA BG4 M.2 NVMe SSD"
picture: "/images/m2-kioxia-bg4-m2-nvme-ssd.jpeg"
functionality_cm4: "Full"
functionality_pi5: "Expansion only, can't boot"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/326"
buy_link: https://amzn.to/328pLrz
videos: []
---
[KIOXIA's BG4 M.2 NVMe SSD](https://business.kioxia.com/en-emea/ssd/client-ssd/bg4.html) drive is an inexpensive NVMe SSD commonly used in laptops.

It is an inexpensive SSD that doesn't include any DRAM, and relies on a technology called NVMe Host Memory Buffer (HMB) that essentially moves NVMe cache to the system's RAM.

Using my [disk-benchmark.sh script](https://raw.githubusercontent.com/geerlingguy/raspberry-pi-dramble/master/setup/benchmarks/disk-benchmark.sh), I got the following performance numbers on the Pi CM4:

| Benchmark | Result |
| --- | --- |
| fio 1M sequential read | 192 MB/s |
| iozone 1M random read | 170 MB/s |
| iozone 1M random write | 157 MB/s |
| iozone 4K random read | 29.71 MB/s |
| iozone 4K random write | 54.50 MB/s |

With a non-HAT+ PCIe expansion card, Raspberry Pi 5 recognizes KIOXIA BG4 SSD when forcing PCIE 3.0 but **not** in PCIE 2.0 (default).
In either 2.0 or 3.0, can not boot into system from the SSD, reporting `` Failed to open the device 'nvme' ''.
