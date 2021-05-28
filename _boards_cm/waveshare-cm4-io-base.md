---
layout: board
title: "Waveshare CM4 IO Base"
short_description: A miniature baseboard with tons of IO, including an M.2 slot.
status: production
picture: "/images/board-waveshare-cm4-io-base.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/110"
link: https://www.waveshare.com/cm4-io-base-b.htm
videos: []
---
This board has a 1 Gbps Ethernet port and features 2x MIPI-Camera connectors. It also has an M.2 M-key slot capable of using NVMe SSDs or other PCIe peripherals. It has a full size HDMI port, an RTC with battery backup (Version B only), and a 4-pin fan connector with a fan controller (Version B only). It also has 2x USB 2.0 ports and a built-in USB 2.0 hub.

Since Version A does not include a fan controller, the fan header looks to be useless, but that's not the case. As WaveShare support confirmed the PWM pin of the fan header is connected to GPIO18 pin directly on variant A. So you can actually use a 5V PWM fan and control its speed by controlling gpio pin 18.
Still waiting for more informwations regarding tacho signal, as WaveShare didn't publish any schematics/documentations for Version A yet.

Sold in 2 versions:
* [Version A](https://www.waveshare.com/cm4-io-base-a.htm) ($25) lacks RTC, RTC battery holder, fan controller
* [Version B](https://www.waveshare.com/cm4-io-base-b.htm) ($40) includes RTC, RTC battery holder, fan controller
