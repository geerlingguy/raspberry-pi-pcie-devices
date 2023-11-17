---
layout: board
title: "Pineberry Pi HatDrive! Top"
short_description: A Pi HAT for a single M.2 2230 or 2242 NVMe SSD.
status: production
picture: "/images/hat-pineberry-pi-hatdrive-top.jpeg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/559"
link: "https://pineberrypi.com/products/hat-top-2230-2240-for-rpi5"
videos: []
redirect_from: /hats/mirko-hat5m1-hat
---
The Pineberry Pi HatDrive! Top is an M.2 HAT for the Raspberry Pi 5. It accepts 2230 or 2242-sized NVMe SSDs (or any other PCIe device with M.2 M-key), and includes a 40mm FPC cable to connect the HAT to the Pi's PCIe external connector.

To boot off an NVMe SSD using this board, please follow the [NVMe SSD Boot on Raspberry Pi 5](https://www.jeffgeerling.com/blog/2023/nvme-ssd-boot-raspberry-pi-5) guide on my website.

If you just wish to use NVMe storage and will boot off microSD, netboot, or USB, you need to enable the external PCIe port on the Pi 5:

  1. Edit the boot config file (`sudo nano /boot/config.txt`)
  2. Add `dtparam=nvme` to the bottom of the file, save it, and reboot

If you wish to experiment with PCIe Gen 3 speeds, you can add the following line after the `nvme` line above:

```
dtparam=pciex1_gen=3
```

PineberryPi is currently testing a number of SSDs in this HAT and their Bottom-oriented 2280-size board, so visit their website for more info.

This 'Top' version of the board has a special power monitoring circuit available to the Pi, and if there are any more details on how to access that measurement, I will post it here. Follow Pineberry Pi for more details in the mean time!
