---
layout: board
title: "Raspberry Pi Atomic Nixie Clock"
short_description: Will Whang's CM4 Nixie clock has GNSS integration and a rubidium atomic clock.
status: prototype
picture: "/images/board-atomic-nixie-clock.jpeg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/205"
link: https://github.com/will127534/RaspberryPiAtomicNixieClock/wiki
videos:
  - https://www.youtube.com/watch?v=tU0xC1ynaT8
---
The Raspberry Pi Atomic Nixie Clock by Will Whang ([@will127534](https://github.com/will127534)) uses the Symmetricom Rubidium Oscillator in a similar way to the [Time Card](https://github.com/opencomputeproject/Time-Appliance-Project/tree/master/Time-Card#readme).

It looks like this board basically marries the Time Card to the Pi CM4 directly, making an even more compact time server package; and it uses

If you wanted to use this as a local time server with PTP, you'd have to wait on hardware timestamping support to get it working with the CM4's NIC, though (see: [raspberrypi/linux#4151](https://github.com/raspberrypi/linux/issues/4151)).

For more on the card, see the [GitHub repository Wiki](https://github.com/will127534/RaspberryPiAtomicNixieClock/wiki).