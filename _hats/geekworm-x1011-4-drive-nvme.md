---
layout: hat
title: "Geekworm X1011 PCIe to Four M.2 NVMe HAT"
short_description: A quad NVMe M.2 SSD HAT for Pi 5.
status: production
picture: "/images/hat-geekworm-x1011-4-drive-nvme.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/618"
link: "https://geekworm.com/collections/raspberry-pi/products/x1011"
videos:
  - https://www.youtube.com/watch?v=yLZET7Jhza8
  - https://www.youtube.com/watch?v=GYN3ub8Qb_I
---
Geekworm's X1011 is a 4-drive M.2 NVMe SSD carrier which uses an ASmedia PCIe Gen 2 switch to bridge four NVMe drives to a Raspberry Pi 5.

It looks like it includes some Pogo pins to provide power to (or leech power from) the Pi 5's USB-C supply input. It has a warning to not plug in both the 5V barrel plug and Pi 5 USB-C power input at the same time (and it may not have any safety in place to prevent a short circuit if you do!).

It supports M.2 drives in 2230/2242/2260/2280 lengths, and does not support NVMe boot (because of the switch), at least not until Raspberry Pi resolves the issue [Can't boot Pi 5 via NVMe behind PCIe switch / bridge](https://github.com/raspberrypi/firmware/issues/1833).
