---
layout: card
title: "AMD Radeon RX 7900 XTX 24GB PCIe x16"
picture: "/images/gpu-radeon-rx7900xtx.png"
functionality: "None"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/503"
buy_link: https://amzn.to/3W58gyX
videos:
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
---
The Radeon RX 7900 XT ("Navi 31") was released in 2022 and is supported by the open source amdgpu driver in the Linux Kernel, version 6.0 and later. It is also supported by AMD's [Radeon Software for Linux as of the 22.40 version](https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-22-40).

It requires a physical x16 PCIe socket. You will need to supply 26A of 12V power (about 315W) to the card directly through it's separate 8-pin PCIe power plugs.

### `amdgpu` (open source) driver

To get the amdgpu driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) on the 6.0 branch (`rpi-6.0.y`) or later.

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

When I do this, the entire system crashes and requires a hard power reset. So far nobody has been able to get beyond the basic initialization due to PCIe memory allocation and access errors on the Pi's bus.

See the linked GitHub issue for more details.
