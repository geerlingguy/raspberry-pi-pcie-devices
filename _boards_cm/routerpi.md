---
layout: board
title: "RouterPi"
short_description: A simple and tidy CM4 Router Board with dual Ethernet ports.
status: prototype
picture: "/images/board-routerpi.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/431"
link: https://blog.zakkemble.net/routerpi-compute-module-4-router/
videos: []
---
The [RouterPi]()https://blog.zakkemble.net/routerpi-compute-module-4-router/ is a simple and tidy CM4 Router Board with dual Ethernet ports. The first port is provided by the built-in NIC, and the second is through a Realtek RTL8111HS directly off the PCIe bus.

This makes it possible for the build to route at a full 1 Gbps both ways, which some of the USB 3.0-based CM4 router designs can't do. See the full specs on the website, and also see [all the project files](https://github.com/ZakKemble/RouterPi) on ZakKemble's GitHub.
