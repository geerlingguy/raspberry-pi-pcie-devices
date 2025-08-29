---
layout: card
title: "StarTech 3 Port IEEE-1394 Mini PCIe FireWire Adapter"
picture: "/images/other-startech-mini-pcie-firewire.jpg"
functionality_cm4: "None"
functionality_pi5: "Full"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/752"
buy_link: https://amzn.to/4lRrQeU
videos: []
---
The StarTech IEEE 1394 3-port Mini PCIe FireWire adapter slots into a mini PCIe slot, and supplies two FireWire 800 ports, and a single FireWire 400.

User `@RobertMCortese` built [Open MRU](https://www.reddit.com/r/tapeless/comments/1n3aqsk/comment/nbc8f4g/), a Raspberry Pi 5-based FireWire camera capture device, using this card and a [GeeekPi PCIe to Mini PCIe HAT](https://amzn.to/47U0vFj).

Inside `/boot/firmware/config.txt`, he added:

```
dtparam=pciex1
dtoverlay=pcie-32bit-dma
```

And it seems to work! He recorded footage using [DVgrab](https://linux.die.net/man/1/dvgrab), and uploaded it to a few threads on Reddit. As someone who owns a working Canon GL2 (which is similar to the GL1 and XL1 I used for my earliest YouTube videos), I am very interested in replicating this setup, so I've ordered the hardware as well :)
