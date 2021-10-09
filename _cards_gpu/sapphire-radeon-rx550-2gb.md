---
layout: card
title: "Sapphire AMD Radeon RX 550 2GB PCIe x16"
picture: "/images/gpu-sapphire-radeon-rx550.jpg"
functionality: "None (so far)"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/6"
buy_link: https://amzn.to/34vadwW
videos:
  - https://www.youtube.com/watch?v=MxcafwjWw24
---
The Radeon RX 550 is a slightly older graphics card that is supported by the open source amdgpu driver in the Linux Kernel.

It will require a 1x to 16x adapter, or some other means of adapting the 16x-sized card pins into the 1x slot on the CM4 IO Board. You should also supply _at least_ 5A of 12V power to the CM4 IO Board if you're powering the card through the IO Board itself.

### `amdgpu` (open source) driver

To get the amdgpu driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile).

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

In my case, the entire Pi locks up and requires a hard power reset. Go figure.

See the linked GitHub issue for more details on how I have been debugging this card, and [the patch](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/6#issuecomment-751169935) I've used to get past a bad `memset()` call.
