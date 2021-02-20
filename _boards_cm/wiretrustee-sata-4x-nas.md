---
layout: board
title: "Wiretrustee 4x SATA NAS Board"
short_description: SATA NAS board with an optional control board.
status: prototype
picture: "/images/board-wiretrustee-sata-4x-nas.png"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/25#issuecomment-769904055"
link: https://wiretrustee.com
videos: []
---
This 4x SATA NAS board operates over the PCIe bus on the Compute Module 4 to deliver at least 220 MB/sec RAID performance.

It also features an optional "control" board (SATA status, power on/off, reset) connected via FPC cable to the main board for a nicer NAS case design. The integrated Marvell 88SE9215 controller does the PCIe <-> SATA signal conversion.

Should be available on Crowdsupply at some point in the future, check out the website for the latest updates!
