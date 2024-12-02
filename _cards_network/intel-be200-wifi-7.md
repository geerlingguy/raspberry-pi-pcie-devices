---
layout: card
title: "Intel BE200 WiFi 7 802.11be M.2 non vPro"
picture: "/images/network-intel-be200-wi-fi-7.jpg"
functionality_cm4: "Untested"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/670
buy_link: https://amzn.to/3B02v0r
videos: []
---
To get this card working on the Pi, you need to compile a custom kernel with the following kernel configuration option added:

```
Device Drivers
  > Network device support
    > Wireless LAN
      > Intel Wireless WiFi Next Gen AGN - Wireless-N/Advanced-N/Ultimate-N (iwlwifi)
        > Intel Wireless WiFi MVM Firmware support
```
[Details on how to compile a kernel, you may want to look at cross-compiling for a significant speed bump](https://www.raspberrypi.com/documentation/computers/linux_kernel.html#kernel)
[Details on iwlwifi](https://wireless.docs.kernel.org/en/latest/en/users/drivers/iwlwifi.html)

Then you also need to install the [latest Intel firmware for the BE200](https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git):

```
$ sudo cp linux-firmware-20241110/iwl* /lib/firmware/
$ sudo reboot
```

To physically connect it to a Pi 5, you may need to buy an M.2 A+E key to PCI Express card adapter, like [this one from ThePiHut](https://thepihut.com/products/m-2-2242-e-key-top-for-raspberry-pi-5).
Please note that the antenna connections use MHF4, not UHF - thus you likely need to order a pair of antennas (or adapter cables) as well.

Please note that 6 GHz support was only introduced to NetworkManager in v1.46 & v1.48, thus you'll have a better experience with an upgrade to Debian (testing): trixie (which includes NetworkManager v1.50)

At this point, I've only tried this as Wi-Fi 7 client - not as an AP.
