---
layout: card
title: "ConnectX-3 Pro Dual port SFP+ Ethernet / MT27520"
picture: "/images/network-mellanox-connectx-3-pro.jpg"
functionality: "Some"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/139"
buy_link: https://amzn.to/3nPDee0
videos: []
---
This card requires a kernel recompile to include Mellanox 1/10/40Gbit Ethernet support. Via `menuconfig`:

```
Device Drivers
  -> Network device support
    -> Ethernet driver support
      -> Mellanox Devices
        -> Mellanox Technologies 1/10/40Gbit Ethernet support
```

Three are also Mellanox OFED drivers, but they have been tricky to install.

The link LED gets lit, the interface is seen by the Raspberry Pi, but then when it tries to send or receive network traffic, errors like the following are printed to `dmesg`:

```
NETDEV WATCHDOG: eth1 (mlx4_core): transmit queue 1 timed out
```

See the linked GitHub issue for more details.
