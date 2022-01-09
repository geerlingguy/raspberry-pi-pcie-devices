---
layout: card
title: "Samsung 980 SSD 500 GB NVMe SSD"
picture: "/images/m2-samsung-980-nvme.jpg"
functionality: "Full"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/355"
buy_link: https://www.amazon.com/gp/product/B08V7GT6F3
videos: []
---

I evaluted the usage of this drive through a mini PCIe to M.2 adapter card on the Turing Pi v2 with a CM4 Lite 4GiB model.

The Samsung 980 tested to ensure the adapter board functionality performed reasonably well; results are shown below.

| Benchmark              | Result      |
|------------------------|-------------|
| fio 1M sequential read | 416 MB/s    |
| iozone 1M random read  | 210.97 MB/s |
| iozone 1M random write | 188.70 MB/s |
| iozone 4K random read  | 14.77 MB/s  |
| iozone 4K random write | 25.38 MB/s  |
