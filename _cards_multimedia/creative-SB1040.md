---
layout: card
title: "Creative SB1040 Sound Blaster X-Fi Xtreme Audio Card"
picture: "/images/multimedia-creative-sb1040.jpg"
functionality: "Full"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/118"
buy_link: https://amzn.to/2PBcXEf
videos: []
---
To get this sound card working with Pi OS, the following overlay needs to be added to the `/boot/config.txt` file:

```
dtoverlay=pcie-32bit-dma
```

In addition, you will need to [recompile the Pi OS kernel](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) with the following option:

```
CONFIG_SND_HDA_INTEL
```

See the linked GitHub issue, as well as the following issue by Darry on the Raspberry Pi forums: [Raspberry PI 4 S/PDIF audio mixer project](https://www.raspberrypi.org/forums/viewtopic.php?f=38&t=306055&sid=1b0d7fce0b4a57ca5a7635b290cc5743).
