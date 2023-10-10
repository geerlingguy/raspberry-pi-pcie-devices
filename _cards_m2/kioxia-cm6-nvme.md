---
layout: card
title: "KIOXIA CM6 PCIe NVMe SFF-TA-1001 (U.3)"
picture: "/images/m2-kioxia-cm6-nvme.jpg"
functionality_cm4: "Full"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/129"
buy_link: https://business.kioxia.com/en-apac/ssd/enterprise-ssd/cm6-r.html
videos:
  - https://www.youtube.com/watch?v=jOU-NDDyyuY
---
This PCI Express NVMe Gen 4 SSD uses the SFF-TA-1001 protocol (sometimes known as U.3) to connect to enterprise servers.

The Raspberry Pi can't directly interface with this drive, but I did successfully test it using a Broadcom MegaRAID card (the 9460-16i), which has Tri-mode support, and Broadcom's 'Elrond' backplane (which is compatible with the SFF-TA-1005 UBM spec).

The drive is capable of up to 6.9 GiB/sec read performance—assuming you have a full PCI Express Gen 4 bus with x4 lanes. The Pi's measly old x1 lane Gen 2 bus can only pump through around 400 MiB/sec, though.

I also tested three of these drives in RAID using the MegaRAID card and StorCLI, and they worked great, offering the best performance of any storage device I've tried on the Pi... which you'd expect with some of the best enterprise storage devices on the market!
