---
layout: card
title: "Mellanox ConnectX-3 EN CX311A SFP+ 10G Ethernet Adapter"
picture: "/images/network-mellanox-connectx-3-EN-CX311A-sfp-10g.jpeg"
functionality: "Minimal"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/143"
buy_link: https://amzn.to/2TlVSQN
videos: []
---
Testing this card requires the Mellanox Ethernet driver to be compiled into the Pi OS kernel. Since it is not by default, you need to recompile the kernel with the following option enabled through `menuconfig`:

```
Device Drivers
  -> Network device support
    -> Ethernet driver support
      -> Mellanox Devices
        -> Mellanox Technologies 1/10/40Gbit Ethernet support
```

Unfortunately, it seems like the driver doesn't currently work on Pi OS, as the driver spits out an exception whenever you try connecting it to a network (e.g. `NETDEV WATCHDOG: eth1 (mlx4_core): transmit queue 0 timed out`).

See the linked GitHub issue for more details.
