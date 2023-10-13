---
layout: card
title: "IO Crest 4 Port SATA III PCIe x1 with Marvell 9215"
picture: "/images/storage-iocrest-sata-3-marvell-9215.jpg"
functionality_cm4: "Full"
functionality_pi5: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/1"
buy_link: https://amzn.to/2HpEWCP
videos:
  - https://www.youtube.com/watch?v=oWev1THtA04
---
Since mid-2021, [SATA support is built into the Raspberry Pi kernel](https://www.jeffgeerling.com/blog/2021/raspberry-pi-os-now-has-sata-support-built), so assuming you have updated to the latest version (`sudo apt upgrade -y`), this card should work out of the box.

On the Raspberry Pi 5, I was able to enumerate SSDs over SATA with this card, but when I started testing them (reading and writing data), I got some PCIe link errors. It's most likely this was down to the prototype PCIe board I was using for testing, so I will test again later!
