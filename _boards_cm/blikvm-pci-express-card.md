---
layout: board
title: "blicube's BliKVM PCI Express CM4 Card"
short_description: A CM4 on a PCI Express card running PiKVM.
status: production
picture: "/images/board-blikvm-pci-express.jpeg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/424"
link: https://www.aliexpress.com/item/3256804386522898.html
videos: []
---
The BliKVM PCI Express CM4 Card slots into a PCI Express slot (with a x1 edge connector), but doesn't get power or connectivity through PCI Express. It instead gets power via PoE or from a rear USB-C port, since it is built to be an internal KVM over IP card. Basically, a PiKVM that's installed directly inside the computer, with Ethernet, USB, and power connections exposed on the back.
