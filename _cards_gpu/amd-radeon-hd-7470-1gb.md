---
layout: card
title: "AMD Radeon HD 7470 1GB"
picture: "/images/gpu-radeon-hd-7470.jpg"
functionality: "Partial"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/430"
buy_link: https://amzn.to/37Hseg4
videos:
  - https://www.youtube.com/watch?v=crnEygp4C6g
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
---
Dell's [AMD Radeon HD 7470](https://amzn.to/37Hseg4) has 1GB of GDDR5 VRAM, uses the Caicos GPU ("Southern Islands"), and was launched in Jan 2012 (according to [TechPowerUp](https://www.techpowerup.com/gpu-specs/radeon-hd-7470-oem.c299)). Power draw is rated at 27W maximum, which could be an issue if driving it direct off the Pi's PCIe slot without an externally-powered riser.

To get the card working currently, you need to:

  1. Image Pi OS (the older January 2022 copy built on top of Debian 5.10.x) to your Pi.
  2. Compile [Coreforge's GPU branch](https://github.com/Coreforge/linux/pull/1) and copy the built kernel to the Pi.
  3. Install AMD firmware: `sudo apt install -y firmware-amd-graphics`
  4. Set up [this custom memcpy.so](https://gist.github.com/Coreforge/91da3d410ec7eb0ef5bc8dee24b91359) to be preloaded on the system.
  5. Reboot.

Once that's done, you should be able to get Xorg working, or just a console. Note that the driver doesn't seem quite stable yet, and many features of the card are not accessible.

See linked GitHub issue for more details and progress getting the card working.
