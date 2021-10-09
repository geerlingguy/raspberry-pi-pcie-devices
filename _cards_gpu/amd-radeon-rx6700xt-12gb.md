---
layout: card
title: "AMD Radeon RX 6700 XT 12GB PCIe x16"
picture: "/images/gpu-radeon-rx6700xt.jpeg"
functionality: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/222"
buy_link: https://amzn.to/3l1K8g7
videos:
  - https://www.youtube.com/watch?v=LO7Ip9VbOLY
---
The Radeon RX 6700 XT ("Navy Flounder") was released in 2021 and is supported by the open source amdgpu driver in the Linux Kernel, version 5.11 and later. It is also supported by AMD's [Radeon Software for Linux as of the 20.50 version](https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-20-50).

It will require a 1x to 16x adapter, or some other means of adapting the 16x-sized card pins into the 1x slot on the CM4 IO Board. You will need to supply 20A of 12V power (about 230W) to the card directly through it's separate power plugs.

### `amdgpu` (open source) driver

To get the amdgpu driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) on the 5.11 branch or later.

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `amdgpu` driver to install.

Also make sure you have the AMD firmware installed (`sudo apt install -y firmware-amd-graphics`) or the driver will complain about missing files.

If you want to be able to boot the Pi all the way, make sure to blacklist the `amdgpu` kernel module:

```
sudo nano /etc/modprobe.d/blacklist-amdgpu.conf

# Put this inside the file and save it:
blacklist amdgpu
```

Now, after a reboot, you can explicitly load the module and see what happens by following `dmesg` in another terminal session:

```
sudo modprobe amdgpu
```

I haven't yet run the card on the Pi, so we'll see what happens then!

See the linked GitHub issue for more details.
