---
layout: card
title: "ASUS XG-C100C 10G Network Adapter"
picture: "/images/network-asus-xg-c100c.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/15"
buy_link: https://amzn.to/38wYOiL
videos: []
---
This 10 Gigabit network card has an Aquantia AQC107 802.3bz NBase-T ethernet controller, which requires the AQtion driver.

Currently the drivers from Marvell's website (Marvell acquired Aquantia in 2019) won't compile on the 64-bit Pi OS beta (though I haven't tested this since 2020), so you have to [recompile the Pi OS kernel](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) to get working driver support.

When recompiling, use `menuconfig` to enable the following two options:

```
Device Drivers
  > Network device support
    > PHY Device support and infrastructure
      > Aquantia PHYs

Device Drivers
  > Network device support
    > Ethernet driver support
      > aQuantia devices
        > aQuantia AQtion(tm) Support
```

After copying over the new kernel and installing modules, you should see a new network interface.

On my Compute Module 4, without any overclock and without changing the MTU from the default of 1500, I was able to get about 3.26 Gbps of bandwidth through the card.

Note that you may be able to get 10 gigabit speeds over shorter Cat5e or Cat6 cable runs, but Cat6a or better cabling is recommended for 10G over copper!
