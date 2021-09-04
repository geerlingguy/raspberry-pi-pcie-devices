---
layout: card
title: "Intel I210-T1 Network Adapter"
picture: "/images/network-intel-i210-nic.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/204"
buy_link: https://amzn.to/3jscEb4
videos: []
---
In tandem with my work on the Time Card (see [#199](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/199)), I noticed [@lasselj](https://github.com/lasselj) had tested the [Intel I210](https://amzn.to/3jscEb4) on a Raspberry Pi and it seems to be working.

I may try picking one of these up to see if I can get it working with the Time Card.

For more discussion of this card and its driver, see [this thread](https://github.com/raspberrypi/linux/issues/4151), particularly the conversation between @lasselj and me. You can also find @lasselj's current kernel config diff attached as a .txt file.
