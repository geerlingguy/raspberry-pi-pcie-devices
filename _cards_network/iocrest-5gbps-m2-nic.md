---
layout: card
title: "IOCrest M.2 5 Gbps NIC"
picture: "/images/network-iocrest-5gbps-m2-nic.jpeg"
functionality_cm4: "Untested"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/675"
buy_link: https://amzn.to/47SyuMz
videos: []
---
The IOCrest M.2 5 Gbps NIC is a 5 GbE M.2 adapter that includes an RJ45 plug for half height or full height PCI Express slots. It can operate at 10/100/1000/2500/5000 Mbps, and requires the Realtek RTL8126 driver.

To get PCIe Gen 3 speeds, edit `/boot/firmware/config.txt` and add the following:

```
dtparam=pciex1_gen=3
```

Then reboot. The kernel driver is not included in the Linux kernel until at least 6.9, so for now, the easiest way to get it running is to install the official driver from Realtek:

  1. [Download the driver from Realtek's website](https://www.realtek.com/Download/ToDownload?type=direct&downloadid=4445)
  2. Expand the driver: `tar -xvf r8126-10.014.01.tar.bz2`
  3. Install the driver: `cd r8126-10.014.01/ && sudo ./autorun.sh`

It should begin working immediately, giving full 5 Gbps network speed on network switches which support that speed.
