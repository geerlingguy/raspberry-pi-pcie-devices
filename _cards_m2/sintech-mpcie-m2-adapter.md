---
layout: card
title: "Sintech M.2 (NGFF) NVMe SSD to Mini PCIe Adapter (with 20cm Cable)"
picture: "/images/adapter-sintech-mpcie-m2.jpg"
functionality: "Currently Testing"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/355"
buy_link: https://www.amazon.com/gp/product/B07DZ8SB8X
videos: []
---

I purchased this card to validate NVMe drive functionality of the mPCIe ports for slots/nodes 1 and 2 on the pre-release [Turing Pi v2](https://turingpi.com/turing-pi-v2-is-here/).

I validated everything and tested using Jeff Geerling's [disk-benchmark](https://github.com/geerlingguy/raspberry-pi-dramble/blob/master/setup/benchmarks/disk-benchmark.sh) script from his [Raspberry Pi Dramble](https://github.com/geerlingguy/raspberry-pi-dramble) repository.

This adapter appears to work without issue in both slots one and two on the Turing Pi v2 pre-production unit.

The Samsung 980 tested to ensure adapter board functionality performed reasonably well; results are shown below.

| Benchmark              | Result      |
|------------------------|-------------|
| fio 1M sequential read | 416 MB/s    |
| iozone 1M random read  | 210.97 MB/s |
| iozone 1M random write | 188.70 MB/s |
| iozone 4K random read  | 14.77 MB/s  |
| iozone 4K random write | 25.38 MB/s  |
