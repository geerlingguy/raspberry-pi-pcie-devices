---
layout: card
title: "Nvidia GeForce GTX 1050 Ti"
picture: "/images/gpu-nvidia-gtx-1050-ti.jpg"
functionality_cm4: "None"
functionality_pi5: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/754"
buy_link: https://amzn.to/42mCXWe
videos: []
---
The GTX 1050 Ti is supported by both Nvidia's proprietary driver and the open source Nouveau driver in the Linux Kernel.

It will require a 1x to 16x adapter, or some other means of adapting the 16x-sized card pins into the 1x slot on the CM4 IO Board. The card takes power from the slot, up to 75W, so make sure your PCIe adapter/riser can supply that much power.

### Nouveau (open source) driver

To get the Nouveau driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile).

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `Nouveau` driver to install.

If you want to be able to boot the Pi all the way, make sure to blacklist the `nouveau` kernel module:

```
sudo nano /etc/modprobe.d/blacklist-nouveau.conf

# Put this inside the file and save it:
blacklist nouveau
```

Now, after a reboot, you can explicitly load the module and see what happens by following `dmesg` in another terminal session:

```
sudo modprobe nouveau
```

See the linked GitHub issue for more details on the current status of this card.
