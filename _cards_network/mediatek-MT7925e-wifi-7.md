---
layout: card
title: "MediaTek MT7925E Wi-Fi 7 (802.11be) M.2"
picture: "/images/network-mediatek-MT7925e-wifi-7.jpeg"
functionality_cm4: "Untested"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue:
buy_link:
---

The MediaTek MT7925E is a PCIe-based Wi-Fi 7 (802.11be) M.2 card, commonly found on modules such as the AW-EB600NF. It works well on Raspberry Pi 5 / CM5 platforms once the required kernel driver and firmware are available.

## Kernel Driver

Support for this card is provided by the `mt7925e` driver, which is part of the `mt76` subsystem.

The driver exists upstream but is **not enabled by default** in the `bcm2712_defconfig` used by Raspberry Pi OS. To use this card, the kernel must be built with the MT7925E PCIe driver enabled as a module (`CONFIG_MT7925E=m`).

Once installed, the driver can be loaded normally and should create a WLAN interface.

## Firmware

The MT7925E requires firmware from the `linux-firmware` repository. If firmware is missing, the kernel log will indicate which files are required.

On Raspberry Pi OS, installing or updating the `linux-firmware` package is usually sufficient to provide the required MediaTek firmware files under `/lib/firmware/mediatek/`.

## PCIe and DMA Requirements (Important)

On Raspberry Pi 5 / CM5, this device requires 32-bit PCIe DMA addressing. Without this, the driver may fail during probe with memory allocation errors.

Add the following line to `/boot/firmware/config.txt`:

dtoverlay=pcie-32bit-dma-pi5

## Hardware Connection

To connect the MT7925E to a Raspberry Pi 5 or CM5, an M.2 A+E-key to PCIe adapter is required.

## Bluetooth Support

Bluetooth functionality is provided via a USB interface on the M.2 card. Not all PCIe adapter HATs wire this USB connection automatically.