---
layout: hat
title: "Radxa Dual 2.5G Router HAT"
short_description: A Pi 5 HAT for 2 2.5G network interfaces, NVMe SSD, and an additional PCIe device.
status: prototype
picture: "/images/hat-radxa-dual-2.5g-router.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/647"
link: "https://docs.radxa.com/en/accessories/dual-2.5-router-hat"
videos: []
---
This HAT includes two 2.5 Gbps Ethernet ports (Realtek 8125BG), an M.2 M-key NVMe slot (2230, 2242, 2260, 2280), an additional PCIe FPC connector (to stack an additional PCIe HAT on top) and a 12V power input.

The interfaces are adapted through an ASM2806 PCIe Gen 3 switch, with 2 uplinks (the Pi 5 can only use 1), and 4 downlinks.

It has a 40 pin GPIO plug, which supplies power to the Pi, and it is not pass-through type, so you would not be able to mount another HAT requiring GPIO on top of this board.

**You must manually enable the external PCIe connector** to get this HAT to work on the Pi 5. Also, if you want Gen 3.0 speeds, also add that setting in `/boot/firmware/config.txt` and reboot:

```
dtparam=pciex1
dtparam=pciex1_gen=3
```

## Booting from NVMe SSD

Because this HAT is not 'HAT+' compatible, if you want to [boot from PCIe](https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#boot-from-pcie), you must also edit the Raspberry Pi EEPROM (`sudo rpi-eeprom-config -e`) and add the following line:

```
PCIE_PROBE=1
```

## Realtek 2.5G NIC performance

The included Realtek NICs are supported out of the box on Raspberry Pi OS, though using the Linux kernel's included driver.

Performance is good, but you may get better performance installing the `r8125` driver directly.

The best way to do that, while keeping the driver and the OS up to date easily, is to use the [`realtek-r8125-dkms` package](https://github.com/awesometic/realtek-r8125-dkms):

Download the latest release from https://github.com/awesometic/realtek-r8125-dkms/releases — then run:

```
sudo dpkg -i realtek-r8125-dkms*.deb
```

You can also manually [download the r8125 driver from Realtek](https://www.realtek.com/Download/List?cate_id=584) and run it's included `autorun.sh` script, but that installation method is more difficult to maintain over time.

## External PCIe FPC Difficulties

So far I have not been able to get any additional PCIe HATs or even another Dual 2.5G Router HAT to work using the downstream PCIe FPC included on this board.

See my current progress here: [Dual 2.5G Router HAT - FPC Connector use](https://forum.radxa.com/t/dual-2-5g-router-hat-fpc-connector-use/25972?u=geerlingguy).
