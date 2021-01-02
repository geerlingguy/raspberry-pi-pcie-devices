---
layout: card
title: "Syba Dual 2.5 Gigabit Ethernet PCIe NIC SD-PEX24066"
picture: "/images/network-syba-dual-25gbe-pcie-nic.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/46"
buy_link: https://amzn.to/37QSNwj
videos: []
---
This card uses the same Realtek 8125 chip that's in the [Rosewill RC20001 2.5 Gbps card]({% link _cards_network/rosewill-rc20001-25gbe.md %}) I tested, but the difference is it has _two_ of them!

Between those two chips and the Pi is an ASMedia 1182 PCI Express 2.0 1x packet switch, which allows the two Realtek chips to work with the Pi over its single PCIe 1x lane.

The Realtek chips on this card require the Realtek 8125 driver, which can be compiled or [cross-compiled](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) into the Pi kernel.

The driver can be selected with `menuconfig` in the path:

```
Device Drivers
  > Network device support
    > Ethernet driver support
      > Realtek devices
        > Realtek 8169/8168/8101/8125 ethernet support
```

I am still testing the card's performance, and will update this page after that testing is complete.
