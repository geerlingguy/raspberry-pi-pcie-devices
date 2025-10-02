---
layout: board
title: "Argo"
short_description: A tiny Raspberry Pi CM5 carrier PCB with built in battery management!
status: prototype
picture: "/images/argo-cm5-pcb.jpeg"
link: "https://github.com/azlan-works/Argo"
videos: []
---

Argo is an opensource CM5 carrier board that fits within the same compute module footprint whilst delivering tons of features, including onboard battery management and USB-C 3.0!

2x 100pin Hirose Connectors
2x MIPI-DSI/CSI
1x Micro-HDMI
1x HDMI FPC connector for external break out
1x PCIe FPC connector, Pi 5 compatible
2x USB-C (One for power/flashing - USB 2.0 and one regular USB 3.0)
Integrated BMS (BQ25895) with up to 5A charging dependent on battery used.
TPS61022 5V boost for upto 3A of constant power from battery or USB.
I2C control for BQ25895 with ADC battery level monitoring.
Onboard LSM6DSV16XTR IMU via I2C
