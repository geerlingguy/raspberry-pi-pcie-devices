---
layout: card
title: "MSI Nvidia GeForce GTX 1080 8G Gamer X"
picture: "/images/gpu-msi-geforce-gtx-1080.jpg"
functionality: "None (so far)"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/123"
buy_link: https://amzn.to/3nyHjUD
videos:
  - https://www.youtube.com/watch?v=1hFPnpVqzkw
---
The GTX 1080 is supported by both Nvidia's proprietary driver and the open source Nouveau driver in the Linux Kernel.

It will require a 1x to 16x adapter, or some other means of adapting the 16x-sized card pins into the 1x slot on the CM4 IO Board. You will also need to supply at least 200W of power through an 8-pin and 6-pin PCI Express power connector on the card itself (in addition to the supply through the PCIe bus on the Pi).

There are two ways to try installing the driver:

### Proprietary Nvidia driver

After flashing the 64-bit Pi OS beta to my Pi, I made sure to upgrade everything on it, and install the kernel source, so the Nvidia driver would compile:

```
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get install -y raspberrypi-kernel-headers
sudo reboot
```

After rebooting, if you have X server running (e.g. you are logged in via GUI), you need to log out. If you're running this over SSH or serial connection, you can quit X server with: `sudo systemctl stop lightdm`.

Now, download Nvidia's latest [AARCH64 Driver for ARM 64-bit processors](https://www.nvidia.com/en-us/drivers/unix/linux-aarch64-archive/), make the downloaded `.run` file executable, and run it with `sudo`:

```
chmod +x NVIDIA-Linux-aarch64-450.119.03.run
sudo ./NVIDIA-Linux-aarch64-450.119.03.run
```

After a reboot, while the driver was loading, I got the error message `Internal error: Oops: 9600004f [#1] PREEMPT SMP`, and you can also see the full call trace [here](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/123#issuecomment-840645850).

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

In my case, the entire Pi locks up and requires a hard power reset.

See the linked GitHub issue for more details on the current status of this card.
