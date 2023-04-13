---
layout: board
title: "BladeBerry v1.0"
short_description: A low profile (1U) CM4 board.
status: prototype
picture: "/images/board-pi4gpu.jpeg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/525"
link: https://github.com/geerlingguy/pi4gpu
videos:
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
---
This board is a collaboration between [Mirek of Mirkotronics](https://twitter.com/Mirko_DIY) and [Jeff Geerling](https://www.jeffgeerling.com).

The PCIe x4 (physical - only x1 connected signals) card is meant to slot into a special adapter board that allows plugging up to a x16 PCI Express card (mainly intended for graphics cards) directly into this card for testing purposes.

The card exposes 1 Gbps Ethernet, full-size HDMI, two USB 2.0 ports, and a 12v barrel plug on the back. It has a USB-C port for programming on the inside edge, as well as a 6-pin PCIe pinout power input so it can be powered internally or from the same power supply used to power the card under test.
