---
layout: board
title: "Timebeat Time Card mini PCIe"
short_description: A CM4 on a PCI Express card that manages time with GPS, PPS, and PTP.
status: production
picture: "/images/board-timebeat-timecard-mini-pcie.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/497"
link: 
videos:
  - https://www.youtube.com/watch?v=dxtVyDXvIBE
---
Timebeat's [TimeCard mini PCIe card](https://store.timebeat.app/products/ocp-tap-timecard-mini-complete-edition) sits in a server's PCIe slot, exposing two serial interfaces (one to an optional Raspberry Pi CM4, one to an optional GPS unit), and the card also holds a TXCO (Temperature Controlled Crystal Oscillator) or OXCO (Oven-Controlled Crystal Oscillator) to hold time very accurately if the signal is lost.

It can be used as a PTP or PPS source, and Timebeat's software (which runs on Raspberry Pi) can also manage time sync across the network, or act as a client synchronizing time via PTP, NTP, GPS, PPS, or any other time source.
