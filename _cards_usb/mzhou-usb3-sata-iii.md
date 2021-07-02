---
layout: card
title: "MZHOU USB 3.0 adapter with M.2 SATA SSD slot"
picture: "/images/usb-mzhou-usb3-sata-iii.jpg"
functionality: "Partial"
driver_required: "Maybe"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/49"
buy_link: https://amzn.to/3hd31M9
videos: []
---
This USB 3.0 card uses a Renesas uPD720201 USB 3.0 controller, and works with the Raspberry Pi, and also includes a SATA M.2 slot which can accept SSDs.

The catch is that the M.2 slot requires a 'SATA input' as well as SATA power. The card is meant to be a convenient way to add in both a SATA M.2 SSD and USB 3.0 to an older motherboard with an existing SATA connector and power supply.

If you'd like to get the full functionality with this card, you'd also need to use a PCIe switch or port multiplier, a separate SATA card, and this card.
