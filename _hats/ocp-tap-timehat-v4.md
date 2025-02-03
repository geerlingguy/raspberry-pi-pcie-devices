---
layout: hat
title: "OCP-TAP TimeHAT V4"
short_description: A HAT providing PPS with an Intel i226 NIC, and a slot for a GPS card.
status: prototype
picture: "/images/hat-ocp-tap-timehat-v2.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/674"
link: "https://www.tindie.com/products/timeappliances/timehat-2/"
videos: []
redirect_from:
  - /hats/ocp-tap-timehat
  - /hats/ocp-tap-timehat-v2
---
The TimeHAT places a PTP-capable Intel i226 2.5 Gbps Ethernet NIC on a Pi HAT with PPS in/out.

The HAT also includes a B-key M.2 slot capable of holding a GPS module; the one I am testing includes a u-blox ZED-F9T-00B-01.

The [TimeHAT hardware was incubated](https://github.com/ahmadexp/Time-Appliance-Project/tree/036bb8fea75baecc263980340a2ceb897a4d9f9c/Incubation/Hardware/TimeHAT) in the OCP Time Appliances Project repository.

See the linked Tindie product page for more information about setting up this HAT, and check out TimeAppliances' [OCP M.2 Neo-M9N GNSS](https://www.tindie.com/products/timeappliances/ocp-m2-neo-m9n-gnss/) module for GPS.

Jeff Geerling also maintains the [time-pi](https://github.com/geerlingguy/time-pi) project, which he uses to maintain the Raspberry Pi running as a PTP grandmaster clock on his studio network.
