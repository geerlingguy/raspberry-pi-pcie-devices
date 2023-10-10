---
layout: card
title: "Nvidia Quadro RTX 8000"
picture: "/images/gpu-nvidia-quadro-rtx-8000.jpg"
functionality_cm4: "Partial"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/480"
buy_link: https://amzn.to/3Ke16pB
videos:
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
  - https://www.youtube.com/watch?v=wl5H5rT87JE
---
The Quadro RTX 8000 is supported (well, not really on ARM64) by both Nvidia's proprietary driver and the open source Nouveau driver in the Linux Kernel.

It will require a 1x to 16x adapter, or some other means of adapting the 16x-sized card pins into the 1x slot on the CM4 IO Board. You also need to supply at least 300W through the card's two PCIe power plugs.

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
chmod +x NVIDIA-Linux-aarch64-525.89.02.run
sudo ./NVIDIA-Linux-aarch64-525.89.02.run
```

> Note: I had to select 'show all OSes' when downloading the driver, to get the arm64 version—it seems like ARM64 is not a supported platform for the Quadro RTX 8000.

When I tried starting Xorg (with `startx`), I got a few errors and it would not launch. Luckily, the system didn't lock up, so that was nice.

The USB-C port on the back seemed to work, at least at USB 2.0 speeds. I plugged in a couple devices and they were immediately recognized by the Pi.

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

When I tried this, I got a kernel panic, but the Pi didn't lock up completely. I couldn't get past this stage due to memory access errors.

See the linked GitHub issue for more details.
