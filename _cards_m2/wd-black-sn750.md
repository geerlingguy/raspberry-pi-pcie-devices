---
layout: card
title: "WD_Black 500GB SN750 NVMe SSD"
picture: "/images/m2-wd-black-sn750.jpg"
functionality_cm4: "Full"
functionality_pi5: "Untested"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/48"
buy_link: https://amzn.to/3aUlR88
videos:
  - https://www.youtube.com/watch?v=4Womn10v71s
---
As long as you can physically connect this NVMe SSD to your Pi (e.g. with a PCIe to NVMe adapter), it should work fine with Pi OS.

It is about as fast as you can get on the Pi currently, and I had no problem booting off it.

One issue you could run into if you don't have enough power through your board is write errors under heavy utilization. This SSD can use up to 10W of power, so you may need more than 3A total supplied to the Pi + board.
