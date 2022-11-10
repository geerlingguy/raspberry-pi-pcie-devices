---
layout: card
title: "Intel AX210NGW WiFi 6E 802.11ax M.2"
picture: "/images/network-intel-ax210-wifi-6e.jpeg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/120"
buy_link: https://amzn.to/3aIBJK9
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

Then you also need to install the [latest Intel firmware package for the AX210](https://www.intel.com/content/www/us/en/support/articles/000005511/wireless.html):

```
$ wget https://wireless.wiki.kernel.org/_media/en/users/drivers/iwlwifi-ty-59.601f3a66.0.tgz
$ tar -xvzf iwlwifi-ty-59.601f3a66.0.tgz
$ cd iwlwifi-ty-59.601f3a66.0/
$ sudo cp iwlwifi-*.ucode /lib/firmware
$ sudo reboot
```

To physically connect it to a Compute Module 4, you may need to buy an M.2 A+E key to PCI Express card adapter—ideally one that comes with antenna connections, like [this one from Amazon](https://amzn.to/3UG6OCL).

Support for using this card in AP mode (so the Raspberry Pi can act as a WiFi 6 Access Point) may be possible, see the linked GitHub issue for more.
