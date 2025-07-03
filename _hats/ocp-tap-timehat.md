---
layout: hat
title: "OCP-TAP TimeHAT"
short_description: A HAT for PTP support with an Intel i226 NIC, a GPS card slot, and PPS in and out.
status: prototype
picture: "/images/hat-ocp-tap-timehat.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/674"
link: "https://www.tindie.com/products/timeappliances/timehat-i226-nic-with-pps-inout-for-rpi5/"
videos:
  - https://www.youtube.com/watch?v=zT71UvUxhjU
redirect_from:
  - /hats/ocp-tap-timehat
  - /hats/ocp-tap-timehat-v2
  - /hats/ocp-tap-timehat-v4
---
The TimeHAT places a PTP-capable Intel i226 2.5 Gbps Ethernet NIC on a Pi HAT with a GPS module M.2 slot and PPS in/out.

The included B-key M.2 slot holds a GPS module; the one I am testing includes a u-blox ZED-F9T, but the later versions ship with the option of a NEO-M9N.

The [TimeHAT hardware was incubated](https://github.com/ahmadexp/Time-Appliance-Project/tree/036bb8fea75baecc263980340a2ceb897a4d9f9c/Incubation/Hardware/TimeHAT) in the OCP Time Appliances Project repository.

See the linked Tindie product page for more information about setting up this HAT, and check out TimeAppliances' [OCP M.2 Neo-M9N GNSS](https://www.tindie.com/products/timeappliances/ocp-m2-neo-m9n-gnss/) module for GPS.

Jeff Geerling also maintains the [time-pi](https://github.com/geerlingguy/time-pi) project, which he uses to maintain the Raspberry Pi running as a PTP grandmaster clock on his studio network.
