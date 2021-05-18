---
layout: card
title: "ASUS PCE-AC51 802.11ac WiFi Adapter"
picture: "/images/network-asus-pce-ac51.jpg"
functionality: "Currently Testing"
driver_required: "Maybe"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/20"
buy_link: https://amzn.to/3ldzLVn
videos:
  - https://www.youtube.com/watch?v=csI19aOJEik
---
This WiFi card supports 802.11ac, and has drivers available for Linux and Windows, at least, but I have had trouble getting these drivers running (or even installable) on the Pi.

Many of the forked Linux drivers won't compile on ARM64 or ARMv7, so I have also tried using the card with a recompiled Linux kernel following my [cross-compile guide](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile), with the following module selected via `menuconfig`:

```
Device Drivers
  > Network device support
    > Wireless LAN
      > Realtek rtlwifi family of devices
        > Realtek RTL8821AE/RTL8812AE Wireless Network Adapter
```

This seems to load the kernel module (`rtl8821ae`), but the card won't work as in the `dmesg` logs I get:

```
$ dmesg | grep rtl
[    5.122777] rtl8821ae 0000:01:00.0: enabling device (0000 -> 0002)
[    5.181119] rtl8821ae: Using firmware rtlwifi/rtl8812aefw.bin
[    5.182443] rtl8821ae 0000:01:00.0: Direct firmware load for rtlwifi/rtl8812aefw.bin failed with error -2
[    5.183980] rtlwifi: Loading alternative firmware rtlwifi/rtl8821aefw.bin
[    5.184083] rtl8821ae: Using firmware rtlwifi/rtl8812aefw_wowlan.bin
[    5.184215] rtl8821ae 0000:01:00.0: Direct firmware load for rtlwifi/rtl8812aefw_wowlan.bin failed with error -2
[    5.184337] rtlwifi: Loading alternative firmware rtlwifi/rtl8821aefw.bin
[    5.189198] rtl_pci: Cannot allocate RX ring
[    5.189218] rtl_pci: tx ring initialization failed
[    5.189228] rtl_pci: Failed to init PCI
[    5.189357] rtl8821ae: probe of 0000:01:00.0 failed with error -12
```

See the linked GitHub issue for the latest status on this card.
