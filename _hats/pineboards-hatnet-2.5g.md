---
layout: hat
title: "Pineboards HatNET! 2.5G"
short_description: A 2.5 Gigabit network HAT for the Pi 5.
status: production
picture: "/images/hat-pineboards-hatnet-2.5g.jpeg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/617"
link: "https://pineboards.io/products/hatnet-2-5g-2-5-gigabit-ethernet-for-raspberry-pi-5"
videos:
  - https://www.youtube.com/watch?v=l30sADfDiM8
redirect_from: /hats/pineberry-pi-hatnet-2.5g
---
The Pineboards HatNET! 2.5G is a 2.5 Gigabit NIC for the Raspberry Pi 5.

It uses the Realtek RTL8125BG NIC, and the same Ethernet jack that's on the Pi 5 itself. It works out of the box, no driver installation is necessary on Raspberry Pi OS, though you may need to enable the PCI external port by adding `dtparam=pciex1` to the end of the `/boot/firmware/config.txt` file and rebooting.
