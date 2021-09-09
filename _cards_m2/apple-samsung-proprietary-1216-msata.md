---
layout: card
title: "Apple Samsung 12+16 Proprietary SSD for Macbook Pro (SM0128G) + Adapter"
picture: "/images/m2-apple-1216-ssd.png"
functionality: "Full"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/157"
buy_link: "https://amzn.to/3Acn04Z"
---
To use Apple's proprietary SSD on the Pi, you'll need two adapters:

  1. [M-key M.2 to Apple SSD adapter](https://amzn.to/3yX1Xls)
  2. M-key M.2 to PCI Express adapter (see other examples on this site-the person who tested this SSD used [this one](https://www.centralcomputer.com/m-2-pci-e-to-pci-e-3-0-x4-adaptersupport-m-key-pcie-ssd.html) from Central Computers)

If you use a x4 PCIe card, you'll also either need to cut the x1 slot on the CM4 IO Board, or also use a PCIe x1 to x4 or x16 adapter.
