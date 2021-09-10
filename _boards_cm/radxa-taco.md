---
layout: board
title: "Radxa Taco"
short_description: An ultimate CM4 carrier board designed for NAS/server/router applications
status: prototype
picture: "/images/board-radxa-taco.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/202"
link: https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/202#issue-980161186
videos: []
---
From @hipboi:
I've been following this repository for quite long time. As a Raspberry Pi fan, we've been working on the Radxa Taco for a while, which is an ultimate CM4 carrier board designed for nas/server/router applications. The ideas is based on the Quad SATA HAT for the Raspberry Pi 4 and go further beyond it. The Radxa Taco has the following features:
  - Use asm1806 pcie switch
  - Dual ethernet, one 1000M from CM4, one 2.5G rtk8125b to pcie switch
  - 5x SATA via JMB585 to pcie switch
  - 1x M.2 M key NVMe to pcie switch
  - 1x PCIe M.2 WiFi module, support Intel AX200
  - 10P header for Top Board with OLED and button
  - RTC/USB 2/uSD card
The case is still in design, planning to make pluggable HDD, also need to cool the CM4 and HDDs. For the ITX case, we are planning something else for it. It will be Quad A55 based, 8GB ECC ram, dual SAS connector for 4 SATA each.
