## Raspberry Pi PCIe Devices

<img src="{{ site.url }}/images/pcie-usb-3-cards.jpeg" style="display: block; margin: auto;" width="600" height="280" />

The following list of PCIe devices have been tested with the Raspberry Pi Compute Module 4 PCIe x1 slot.

Many of these devices were tested for Jeff Geerling's [Raspberry Pi Compute Module 4 Review](https://www.jeffgeerling.com/blog/2020/raspberry-pi-compute-module-4-review).

If you would like to have a device added to this list, or find any missing or incorrect information, please file an Issue and/or Pull Request against [this project on GitHub](https://github.com/geerlingguy/raspberry-pi-pcie-devices).

> Many of the device links on this page are Amazon affiliate links. If you do not wish to use those links, copy the device name to search for it at any major electronics retailer (e.g. [Newegg](https://www.newegg.com), [Micro Center](https://www.microcenter.com), [Amazon](https://www.amazon.com), etc.).

## Contents

{:toc}

### GPUs (Graphics Cards)

| Device | Functionality | Driver required? | Notes |
| ------ | ------------- | ---------------- | ----- |
| [Zotac GeForce GT 710 1GB PCIe x1](https://amzn.to/3mdy1LE) | (currently testing - see [#2](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/2)) | Yes | Drivers for ARM: [32-bit](https://www.nvidia.com/en-us/drivers/unix/linux-arm-display-archive/), [64-bit](https://www.nvidia.com/en-us/drivers/unix/linux-aarch64-archive/). |
| [VisionTek Radeon 5450 1GB PCIe x16](https://amzn.to/2Hh6KcI) | (currently testing - see [#4](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/4)) | N/A | Needs [x1 to x16 cable](https://amzn.to/2ThfzFD). |

### USB cards

| Device | Functionality | Driver required? | Notes |
| ------ | ------------- | ---------------- | ----- |
| [Syba SD-PEX20199 PCIe x1 USB 3.1 & 3.0 adapter](https://amzn.to/31yArwD) | Full | No | N/A |
| [Inateck PCIe x1 USB 3.0 adapter](https://amzn.to/3oplt67) | Limited | No | Sometimes mounted devices at 5 Gbps, other times at 480 Mbps. |
| [A ADWITS PCIe 1x 'PCI Experss' USB 3.0 adapter with VL805](https://amzn.to/37CKTHr) | Limited | No | Sometimes mounted devices at 5 Gbps, other times at 480 Mbps. Requires external [5v DC 4-pin Molex power supply](https://amzn.to/37Cy0NA). |

### NVMe adapters

| Device | Functionality | Driver required? | Notes |
| ------ | ------------- | ---------------- | ----- |
| [NGFF M.2 M Key SSD to PCIe 1x Adapter](https://amzn.to/37tfWW1) | Full | No | Tested with [Samsung 970 EVO Plus](https://amzn.to/3mfJM4a). |
| [MZHOU NVMe M.2 SSD M Key to PCIe 1x Adapter](https://amzn.to/3maJ6NF) | Full | No | Tested with [Samsung 970 EVO Plus](https://amzn.to/3mfJM4a). |
| [Xiwai NGFF M Key M.2 SSD to PCIe 1x Adapter](https://amzn.to/3ogoQvL) | Full | No | Tested with [Samsung 970 EVO Plus](https://amzn.to/3mfJM4a). |

### Network adapters

| Device | Functionality | Driver required? | Notes |
| ------ | ------------- | ---------------- | ----- |
| [Intel I340-T4 PCIe x4 4-port Gigabit Network Adapter](https://amzn.to/37vHQR6) | (awaiting arrival - see [#3](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/3)) | N/A | N/A |

### SATA adapters

| Device | Functionality | Driver required? | Notes |
| ------ | ------------- | ---------------- | ----- |
| [IO Crest 4 Port SATA III PCIe x1 with Marvell 9215](https://amzn.to/2HpEWCP) | (awaiting arrival - see [#1](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/1)) | N/A | User 6by9 [mentioned](https://www.raspberrypi.org/forums/viewtopic.php?p=1744542#p1744542) compatibility, required kernel modules `CONFIG_ATA` and `CONFIG_SATA_AHCI` |

## About

This project is maintained by [Jeff Geerling](https://www.jeffgeerling.com). The Raspberry Pi Compute Module 4 is a product of [Raspberry Pi (Trading) Limited](https://www.raspberrypi.org/about/).
