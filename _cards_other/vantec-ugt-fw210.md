---
layout: card
title: "Vantec 2+1 FireWire 800/400 PCIe Combo Host Card (UGT-FW210)"
picture: "/images/other-vantec-ugt-fw210.jpg"
functionality: "None"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/297"
buy_link: https://www.vantecusa.com/products_detail.php?p_id=130
videos: []
---
The Vantec 2+1 FireWire 800/400 PCIe Combo Host Card adds two FireWire 800 ports and one FireWire 400 port (6-pin).

The card is billed as 'plug and play', but no driver is loaded by default on Raspberry Pi OS.

An attempt was made to compile in the proper driver, by recompiling the kernel with the following option added via `menuconfig`:

```
Device Drivers
  -> IEEE 1394 (FireWire) support
    -> FireWire driver stack
      -> OHCI-1394 controllers, Storage devices (SBP-2 protocol), IP networking over 1394
```

But the card still didn't show a kernel module loaded, and no devices have been able to be used with the card yet.
