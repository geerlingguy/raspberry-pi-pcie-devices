---
layout: board
title: "MPi4 NEC MediaPlayer Kit (DS1-IF20CE)"
short_description: An open platform solution for digital signage applications.
status: production
picture: "/images/board-mpi4-nec-mediaplayer-kit.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/386"
link: https://www.sharpnecdisplays.eu/p/uk/en/products/accessories/details/t/options/computing/rp/raspberrypi-compute-module4.xhtml
videos:
  - https://www.youtube.com/watch?v=zr4WQ8dhhG8
  - https://www.youtube.com/watch?v=-epPf7D8oMk
redirect_from: /boards_cm/sharp-nec-ds1-if20ce
---
The [Sharp/NEC DS1-IF20CE Compute Module Interface Board](https://www.sharpnecdisplays.us/products/accessories/mpi4e), product code MPI4E, is part of Sharp/NEC's display solution for a MediaPlayer/SoC integration with their displays. [Here is a user manual mentioning the board](https://assets.sharpnecdisplays.us/documents/installationguides/ma-series-installationguide.pdf).

They used to sell the CM3+ version of the board ([DS1-IF10CE](https://www.bhphotovideo.com/c/product/1339096-REG/nec_ds1_if10ce_raspberry_pi_compute_module.html)) standalone.

It's built to be integrated exclusively into NEC's MultiSync displays. It contains an edge connector exposing certain GPIO pins to the monitor's internal bus, so you can control the monitor via serial connection, and also accept signals from the monitor (e.g. for shutdown, IR control for media applications, etc.). Externally it includes 2 USB-A ports and an Ethernet port connected to the Pi, along with an internal Ethernet connection through to the monitor's built-in Ethernet switch. It also has a micro USB port for flashing the eMMC along with a boot select switch exposed externally.

Sharp exposes downloads for their official Media Player utility on their website: [Raspberry Pi Compute Module Downloads](https://www.sharpnecdisplays.us/support-and-services/raspberrypi/244#softwaredownloads/)
