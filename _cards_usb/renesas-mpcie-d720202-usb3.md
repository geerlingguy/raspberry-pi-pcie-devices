---
layout: card
title: "Renesas µPD720202 USB 3.0 Host Controller"
picture: "/images/usb-renesas-mpcie-d720202.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/264"
buy_link: https://es.aliexpress.com/item/32847876690.html?spm=a2g0s.9042311.0.0.b2c063c0LQqdvF
videos: []
---
The [Renesas Electronics µPD720202 USB 3.0 Host Controller](https://www.renesas.com/us/en/products/interface-connectivity/usb-switches-hubs/upd720202-usb-30-host-controller) is is a USB host controller compatible with the USB 3.0 and xHCI (eXtensible Host Controller Interface) 1.0 specifications. The system bus is compatible with the PCIe Gen2 specification. The controller provides two USB ports with LS (Low-Speed) / FS (Full-Speed) / HS (High-Speed) / SS (SuperSpeed) support.

The card works out of the box, but requires extra power via a berg (floppy) connector. You can power it from the berg plug on the CM4 IO board using either PoE or barrel plug power. For more information, see the [GitHub issue](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/264).
