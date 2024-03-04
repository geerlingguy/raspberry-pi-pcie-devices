---
layout: hat
title: "NVPI5-2280B NVMe Base "
short_description: PCBWay's long NVMe SSD Base board Raspberry Pi 5.
status: production
picture: "/images/hat-nvme-nvpi5-2280b.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/588"
link: "https://www.elecrow.com/cooperated-designers/nvme-raspberry-pi-5-nvpi5-2280b-base-for-raspberry-pi-5-nvme-223.html"
videos: []
---
NVMe (M.2 M-Key 2230, 2242, 2260, 2280 PCIe Gen3 x1) SSD base peripheral Board for Raspberry Pi 5

NVMe HAT PCB with M.2 Slot (M-Key)

# Features:

- Compatible with other HAT shield
- Support boot from the NVMe drive
- 60mm length Flat Flex Cable
- Supports installation of official active coolers
- Dual LED Indicators: “PWR” and “ACT”
- Supports 2230/2242/2260/2280 NVME M2 SSD
- M.2 Standard-Compliant Power System
- Ext +5V Power input connector
- Base mounting

# Packing List:
- 1 x NVPI5-2280B
- 2 x PCIe FFC cable (30mm length)
- 2 x PCIe FFC cable (60mm length)
- 4 x M2.5x14mm F/F Spacers
- 4 x M2.5x6+6mm F/M Spacers
- 5 x M2.5x5mm Screws
- 2 x M2x4mm Screws
- 1 x XH2.54 4P Power cable

# How to use?
## Enabling PCIe
Add the following option into /boot/firmware/config.txt and reboot:

```
# Enable the PCIe external connector.
dtparam=pciex1
```
### PCIe Gen 3.0
The connection is certified for Gen 2.0 speeds (5 GT/sec), but you can force it to Gen 3.0 (10 GT/sec) if you add the following lines to your /boot/firmware/config.txt.

```
# Enable the PCIe external connector
dtparam=pciex1
# Force Gen 3.0 speeds
dtparam=pciex1_gen=3
```
**WARNING:**
>  The Raspberry Pi 5 is not certified for Gen 3.0 speeds, and connections to PCIe devices at these speeds may be unstable.
> You should then reboot your Raspberry Pi for these settings to take effect.

### Booting from PCIe
Once enabled, and after rebooting, an NVMe disk attached via the PCIe should be visible. However, your Raspberry Pi won’t try to boot from the NVMe drive. If you wish to enable boot support you will need to change the BOOT_ORDER in the bootloader configuration. Edit the EEPROM configuration by:

`sudo rpi-eeprom-config --edit`

and change the BOOT_ORDER line to be as below.

`BOOT_ORDER=0xf416`

If you are booting from a non-HAT+ device you should also add:

`PCIE_PROBE=1`

to the EEPROM configuration.