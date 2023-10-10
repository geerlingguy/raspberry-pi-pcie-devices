---
layout: card
title: "Time Card - Open Compute Project"
picture: "/images/other-time-card.jpg"
functionality_cm4: "Full"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/199"
buy_link: https://github.com/opencomputeproject/Time-Appliance-Project/tree/master/Time-Card
videos:
  - https://www.youtube.com/watch?v=tU0xC1ynaT8
  - https://www.youtube.com/watch?v=RvnG-ywF6_s
---
Time Card is the heart of the Open Time Server project. It is an entirely open source board design that can be used with the OCP PTP driver in the Linux kernel to run a computer as a grandmaster clock source with hardware timestamping.

The card includes a GNSS receiver, a rubidium oscillator, and an FPGA to translate the timing signals on the PCI Express bus.

The card works with the Raspberry Pi Compute Module 4 IO Board using a riser or adapter (the card is x4, while the IO Board's slot is x1), but you currently need to compile a custom Pi kernel to use it, with kernel 5.11 or later (I tested with kernel 5.14), and with the following option enabled in `menuconfig`:

```
Device Drivers
  > PTP clock support
    > OpenCompute TimeCard as PTP clock
```

To use the Pi as a PTP hardware timestamping grandmaster clock, you need to have a NIC with hardware timestamping support.

The NIC built into the CM4 (Broadcom BCM54210PE PHY) has PTP support, but the [IEEE1588-2008 support is currently not enabled in Pi OS itself](https://github.com/raspberrypi/linux/issues/4151), so you can't currently use the Pi as a PTP time source with hardware timestamping.

It remains to be seen whether the CM4 could be used with a PCIe switch and an external NIC with hardware PTP timestamping support in tandem with the Time Card.
