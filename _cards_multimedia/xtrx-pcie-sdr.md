---
layout: card
title: "XTRX PCIe Software Defined Radio"
picture: "/images/multimedia-xtrx-pcie-sdr.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/71"
buy_link: "https://www.crowdsupply.com/fairwaves/xtrx"
videos: []
---
The [XTRX PCIe SDR](https://www.crowdsupply.com/fairwaves/xtrx) is a designed for embedded SDR projects.

To get it working on the Compute Module 4, you need to add the following to your `/boot/config.txt` file and reboot:

```
dtoverlay=pcie-32bit-dma
```

Also, [`VA_DMA_ADDR_FIXUP`](https://github.com/xtrx-sdr/xtrx_linux_pcie_drv/blob/master/xtrx.c#L181) must be defined in the driver.

See the linked GitHub issue for more details.
