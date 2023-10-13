---
layout: card
title: "I/O Crest SI-PEX60016 1 to 2 Port PCIe Switch"
picture: "/images/adpater-iocrest-si-pex60016-2-port-pcie-switch.jpg"
functionality_cm4: "Full"
functionality_pi5: "Full"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/14"
buy_link: https://amzn.to/2Ie0bI3
videos:
  - https://www.youtube.com/watch?v=vBccak8f-VY
---
This card requires external power (and includes a molex to floppy power adapter), but works great on both the Raspberry Pi CM4 and Pi 5 model B.

Note that certain devices can behave strange when run behind a PCI Express switch / bridge. Notably, NVMe drives cannot be used as boot drives on the Compute Module 4 behind a switch (and it remains to be determined if they will work on the Raspberry Pi 5 behind a switch).
