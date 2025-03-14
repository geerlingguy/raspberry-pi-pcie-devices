---
layout: card
title: "Intel BE200 WiFi 7 802.11be M.2 non vPro"
picture: "/images/network-intel-be200-wi-fi-7.jpg"
functionality_cm4: "Full"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/670
buy_link: https://amzn.to/3B02v0r
videos:
  - https://www.youtube.com/watch?v=1oXrJ4wQ2dQ
---
Since early 2025, Raspberry Pi OS includes the Intel `iwlwifi` driver, so all you need to do to enable this card is install the appropriate firmware.

The firmware version will change over time as Pi OS is updated to newer kernels, but as of March 2025, running kernel 6.6.y, the instructions for installing the appropriate firmware are as follows:

First, check the `dmesg` logs to see which firmware files are being loaded (and failing):

```
dmesg | grep iwlwifi
```

Then, in the [linux-firmware](https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/) repository, search for that driver version.

Download both the `ucode` and `pnvm` files for the firmware version that's missing, and make sure they end up in the `/lib/firmware` directory, for example:

```
cd /lib/firmware
sudo wget -o - -q https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/iwlwifi-gl-c0-fm-c0-83.ucode
sudo wget -o - -q https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/iwlwifi-gl-c0-fm-c0.pnvm
```

To physically connect the card to a Pi 5, you will need an M.2 A+E key to PCI Express card adapter, like [Waveshare's PCIe to M.2 E-key HAT+](https://amzn.to/3XpXOpg). The Waveshare HAT includes adapters from the MHF4 to u.FL antenna connectors, and you can then use any standard SMA screw-on antenna with the HAT. Otherwise, you have to figure out how to get MHF4 to some form of antenna.

At this point, I've only tried this as Wi-Fi 7 client - not as an AP. Others on GitHub have successfully used it in AP mode, but I'm not sure if that works across all bands or just some.

## Bluetooth Support

Bluetooth support requires a USB connection—not all M.2 adapter HATs supply this (though the Waveshare mentioned above does).

With that, you will need to download the appropriate Bluetooth firmware for the WiFi card into `/lib/firmware/intel`. Search `dmesg | grep Bluetooth` and see if there are messages about missing firmware. Then go find that missing firmware in the [linux-firmware repository's `intel` section](https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/intel/) and download it, for example:

```
cd /lib/firmware/intel
sudo wget -o - -q https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/intel/ibt-0291-0291.ddc
sudo wget -o - -q https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/intel/ibt-0291-0291.sfi
```

Check for Bluetooth functionality:

```
# Shows active Bluetooth adapters
sudo hciconfig

# Disable built-in bluetooth and enable Intel Bluetooth
sudo hciconfig hci1 down
sudo hciconfig hci0 up

# If RF-kill blocks enabling the device, check why:
rfkill list all

# Then unblock it if it's blocked:
sudo rfkill unblock bluetooth

# Check for Bluetooth devices:
bluetoothctl scan on
```
