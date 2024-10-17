---
layout: hat
title: "Pineboards HatDrive! Bottom"
short_description: A Pi HAT for a single M.2 2242 or 2280 NVMe SSD.
status: production
picture: "/images/hat-pineboards-hatdrive-bottom.jpeg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/559"
link: "https://pineboards.io/products/hatdrive-bottom-2230-2242-2280-for-rpi5"
videos:
  - https://www.youtube.com/watch?v=EXWu4SUsaY8
  - https://www.youtube.com/watch?v=EAlrCFJZlnI
  - https://www.youtube.com/watch?v=a-ImUnRwjAo
redirect_from: /hats/pineberry-pi-hatdrive-bottom
---
The Pineboards HatDrive! Bottom is an M.2 HAT for the Raspberry Pi 5. It accepts 2242 or 2280-sized NVMe SSDs (or any other PCIe device with M.2 M-key), and includes a 40mm FPC cable to connect the HAT to the Pi's PCIe external connector.

To boot off an NVMe SSD using this board, please follow the [NVMe SSD Boot on Raspberry Pi 5](https://www.jeffgeerling.com/blog/2023/nvme-ssd-boot-raspberry-pi-5) guide on my website.

If you just wish to use NVMe storage and will boot off microSD, netboot, or USB, you need to enable the external PCIe port on the Pi 5:

  1. Edit the boot config file (`sudo nano /boot/config.txt`)
  2. Add `dtparam=nvme` to the bottom of the file, save it, and reboot

If you wish to experiment with PCIe Gen 3 speeds, you can add the following line after the `nvme` line above:

```
dtparam=pciex1_gen=3
```

Pineboards is currently testing a number of SSDs in this HAT and their Bottom-oriented 2280-size board, so visit their website for more info.

The 'Bottom' version of this HAT has a separate 5V power input adapter—I am currently asking Pineboards how it is to be used.
