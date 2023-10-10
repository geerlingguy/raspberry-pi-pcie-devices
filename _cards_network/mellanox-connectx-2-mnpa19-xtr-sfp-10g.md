---
layout: card
title: "Mellanox ConnectX-2 MNPA19-XTR SFP+ 10G Ethernet Adapter"
picture: "/images/network-mellanox-connectx-2-mnpa19-xtr.jpg"
functionality_cm4: "Minimal"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/21"
buy_link: https://amzn.to/3hfdhBZ
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

Unfortunately, it seems like the driver doesn't currently work on Pi OS, as the driver spits out an exception whenever you try connecting it to a network (e.g. `NETDEV WATCHDOG: eth1 (mlx4_core): transmit queue 1 timed out`).

See the linked GitHub issue for more details.
