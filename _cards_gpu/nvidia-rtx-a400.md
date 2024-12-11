---
layout: card
title: "Nvidia RTX A400"
picture: "/images/gpu-nvidia-rtx-a400.jpg"
functionality_cm4: "Partial"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/677"
buy_link: https://amzn.to/4f7AkeH
videos: []
---
The Quadro RTX 400 is supported by both Nvidia's proprietary driver and the open source Nouveau driver in the Linux Kernel.

You need to provide a physical x16 slot. No external power is required, besides up to 75W of PCIe slot power.

There are two ways to try installing the driver:

### Proprietary Nvidia driver

After flashing the 64-bit Pi OS beta to my Pi, I made sure to upgrade everything on it, and install the kernel source, so the Nvidia driver would compile:

```
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get install -y raspberrypi-kernel-headers
sudo reboot
```

Now, download Nvidia's latest [AARCH64 Driver for ARM 64-bit processors](https://www.nvidia.com/en-us/drivers/unix/linux-aarch64-archive/), make the downloaded `.run` file executable, and run it with `sudo`:

```
chmod +x NVIDIA-Linux-aarch64-565.77.run
sudo ./NVIDIA-Linux-aarch64-565.77.run
```

Currently these cards all throw an error about 'RmInitAdapter failed'... see the linked GitHub issue for more help.

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

When I tried this, I got a kernel panic. See the linked GitHub issue for more details.
