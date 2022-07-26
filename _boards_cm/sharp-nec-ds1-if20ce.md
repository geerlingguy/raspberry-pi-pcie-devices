---
layout: board
title: "Sharp/NEC DS1-IF20CE Compute Module Interface Board"
short_description: A stainless-steel-enclosed CM4 computer with multiple industrial interfaces.
status: prototype
picture: "/images/board-sharp-nec-ds1-if20ce.jpeg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/445"
link: https://www.sharpnecdisplays.us/products/accessories/mpi4e
videos: []
---
The [Sharp/NEC DS1-IF20CE Compute Module Interface Board](https://www.sharpnecdisplays.us/products/accessories/mpi4e), product code MPI4E, is part of Sharp/NEC's display solution for a MediaPlayer/SoC integration with their displays. [Here is a user manual mentioning the board](https://assets.sharpnecdisplays.us/documents/installationguides/ma-series-installationguide.pdf).

They used to sell the CM3+ version of the board ([DS1-IF10CE](https://www.bhphotovideo.com/c/product/1339096-REG/nec_ds1_if10ce_raspberry_pi_compute_module.html)) standalone.

It's built to be integrated exclusively into NEC's MultiSync displays. It contains an edge connector exposing certain GPIO pins to the monitor's internal bus, so you can control the monitor via serial connection, and also accept signals from the monitor (e.g. for shutdown, IR control for media applications, etc.). Externally it includes 2 USB-A ports and an Ethernet port connected to the Pi, along with an internal Ethernet connection through to the monitor's built-in Ethernet switch. It also has a micro USB port for flashing the eMMC along with a boot select switch exposed externally.
