---
layout: board
title: "BIGTREETECH PI4B"
short_description: A Raspberry Pi 4 model B-sized CM4 adapter board.
status: production
picture: "/images/board-bigtreetech-pi4b.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/456"
link: https://amzn.to/3M78RNa
videos:
  - https://www.youtube.com/watch?v=Krpac-MaD5s
---
This board is almost identical to a Pi 4 model B in its layout—the ports are all in the exact same places, though the DSI and CSI display/camera connectors are slightly different due to the Compute Module's positioning. Also missing is any USB 3.0 (that is replaced by two extra USB 2.0 ports), and there is no PoE HAT compatibility. The Ethernet port is labeled as 1Gbps, but will only be 10/100 if you buy BigTreeTech's CB1 board instead of a CM4.

There are a few dipswitches for setting write protect, flashing eMMC, etc., but they are very tiny and hard to reach, you need a tiny tool to get in there if you want to use this board to flash a device.

There's also a 5V/GND header to plug in a non-PWM fan at the edge of the board.

Overall it's put together well and works great with both a CB1 and CM4 that I've tested.
