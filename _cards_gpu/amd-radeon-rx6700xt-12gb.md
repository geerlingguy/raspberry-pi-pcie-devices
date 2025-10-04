---
layout: card
title: "AMD Radeon RX 6700 XT 12GB PCIe x16"
picture: "/images/gpu-radeon-rx6700xt.jpeg"
functionality_cm4: "None"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/222"
buy_link: https://amzn.to/3l1K8g7
videos:
  - https://www.youtube.com/live/Q3bY0qHl8gw
  - https://www.youtube.com/watch?v=AyR7iCS7gNI
  - https://www.youtube.com/watch?v=7Qx_bdFSSuc
  - https://www.youtube.com/watch?v=LO7Ip9VbOLY
  - https://www.youtube.com/watch?v=crnEygp4C6g
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
---
The Radeon RX 6700 XT ("Navy Flounder") was released in 2021 and is supported by the open source amdgpu driver in the Linux Kernel, version 5.11 and later. It is also supported by AMD's [Radeon Software for Linux as of the 20.50 version](https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-20-50).

It will require a 1x to 16x adapter, or some other means of adapting the 16x-sized card pins into the 1x slot on the CM4 IO Board. You will need to supply 20A of 12V power (about 230W) to the card directly through it's separate power plugs.

### `amdgpu` (open source) driver

To get the amdgpu driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile).

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `amdgpu` driver to install.

Also make sure you have the AMD firmware installed (`sudo apt install -y firmware-amd-graphics`) or the driver will complain about missing files.

On the Compute Module 4, to avoid the whole system from locking up on boot, make sure to blacklist the `amdgpu` kernel module:

```
sudo nano /etc/modprobe.d/blacklist-amdgpu.conf

# Put this inside the file and save it:
blacklist amdgpu
```

Now, after a reboot, you can explicitly load the module and see what happens by following `dmesg` in another terminal session:

```
sudo modprobe amdgpu
```

On the Compute Module 4, nobody has been able to get the `amdgpu` drivers to get far in their initialization stages. The Pi crashes due to PCIe bus memory allocation/mapping errors.

On the Pi 5, we are able to get full GPU graphics acceleration using Coreforge's [rpi-6.6.y-gpu](https://github.com/Coreforge/linux/tree/rpi-6.6.y-gpu) branch. If running Pi OS, you may have to restart `lightdm` after booting, otherwise it will default to the Pi's built-in GPU.

See the linked GitHub issue for more details.
