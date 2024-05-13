---
layout: card
title: "Pinedrive NVMe SSD 256GB (2242)"
picture: "/images/m2-pinedrive-2242-nvme-ssd.jpeg"
functionality_cm4: "Full"
functionality_pi5: "Full"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/631"
buy_link: https://pineboards.io/products/pinedrive-nvme-ssd-256gb-2242
videos: []
---
The [Pinedrive NVMe SSD 256GB (2242)](https://pineboards.io/products/pinedrive-nvme-ssd-256gb-2242) costs €45,99 EUR (about $50 USD as of this writing), and is verified to work with the Raspberry Pi 5 (and earlier generations).

It's a white-labeled 3D TLC NAND SSD running at PCIe Gen 3 x4, and on a faster computer, should get up to 2.2 GB/sec reads and 1.3 GB/sec writes. On the Pi 5's single PCIe Gen 3 lane, it should get around 850 MB/sec.

The drive has a 3 year warranty with a 1.5m hour MTBF and 200 TBW.

## Benchmark Results

Tested on 2024-05-13 on a Raspberry Pi 5 at PCIe Gen 3 speeds:

| Benchmark                  | Result |
| -------------------------- | ------ |
| iozone 4K random read      | 61.08 MB/s |
| iozone 4K random write     | 267.79 MB/s |
| iozone 1M random read      | 812.33 MB/s |
| iozone 1M random write     | 746.80 MB/s |
| iozone 1M sequential read  | 812.76 MB/s |
| iozone 1M sequential write | 727.14 MB/s |
