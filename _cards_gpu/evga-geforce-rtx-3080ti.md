---
layout: card
title: "EVGA Nvidia GeForce RTX 3080 Ti"
picture: "/images/gpu-evga-geforce-rtx-3080ti.jpg"
functionality_cm4: "None"
functionality_pi5: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/549"
buy_link: https://amzn.to/3PJFMcM
videos:
  - https://www.youtube.com/watch?v=nBtOEmUqASQ
---
The RTX 3080 Ti is supported by both Nvidia's proprietary driver and the open source Nouveau driver in the Linux Kernel.

It requires a 16x slot. You should also supply _at least_ 5A of 12V power to whatever PCIe riser you use to connect it, in addition to external power to the card's PCIe power inputs.

There are two ways to try installing the driver:

### Proprietary Nvidia driver

After flashing 64-bit Pi OS, run upgrades and install the kernel source, so the Nvidia driver will compile:

```
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get install -y raspberrypi-kernel-headers
sudo reboot
```

After rebooting, you need to exit the graphical user interface before installing the Nvidia drivers.

Now, download Nvidia's latest [AARCH64 Driver for ARM 64-bit processors](https://www.nvidia.com/en-us/drivers/unix/linux-aarch64-archive/), make the downloaded `.run` file executable, and run it with `sudo`:

```
chmod +x NVIDIA-Linux-aarch64-535.113.01.run
sudo ./NVIDIA-Linux-aarch64-535.113.01.run
```

After a reboot, the card would initialize, but ultimately fail with the message `RmInitAdapter failed!`.

### Nouveau (open source) driver

To get the Nouveau driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile).

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `Nouveau` driver to install.

You can blacklist the `nouveau` kernel module to observe how it loads in:

```
sudo nano /etc/modprobe.d/blacklist-nouveau.conf

# Put this inside the file and save it:
blacklist nouveau
```

Now, after a reboot, you can explicitly load the module and see what happens by following `dmesg` in another terminal session:

```
sudo modprobe nouveau
```

See the linked GitHub issue for more details.
