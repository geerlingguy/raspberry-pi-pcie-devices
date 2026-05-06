---
layout: card
title: "Samsung PM981a SSD 512 GB NVMe"
picture: "/images/m2-samsung-pm981a-nvme.jpg"
functionality_cm4: "Untested"
functionality_pi5: "Full"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/48"
buy_link: []
videos: []
---

I evaluted the usage of this drive through a [Argon40 NEO 5 M.2 NVME case](https://argon40.com/products/argon-neo-5-m-2-nvme-for-raspberry-pi-5) with a RPi5 8GiB model.

The PM981a is the OEM version of the 970 EVO Plus
I tested to ensure the adapter board functionality performed reasonably well;
Results are shown below.

| Benchmark                  | Result |
| -------------------------- | ------ |
| iozone 4K random read      | 73.74 MB/s |
| iozone 4K random write     | 167.21 MB/s |
| iozone 1M random read      | 412.16 MB/s |
| iozone 1M random write     | 381.59 MB/s |
| iozone 1M sequential read  | 419.09 MB/s |
| iozone 1M sequential write | 377.52 MB/s |
