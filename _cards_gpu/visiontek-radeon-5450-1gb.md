---
layout: card
title: "VisionTek AMD Radeon 5450 1GB PCIe x16"
picture: "/images/gpu-visiontek-radeon-5450.jpg"
functionality_cm4: "Partial"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/4"
buy_link: https://amzn.to/2Hh6KcI
videos:
  - https://www.youtube.com/watch?v=crnEygp4C6g
  - https://www.youtube.com/watch?v=ikpgZu6kLKE
---
This graphics card needs a [x1 to x16 powered adapter](https://amzn.to/3dZQM2u). The `radeon` driver for this card requires a kernel recompile, and the card is too old to be compatible with the `amdgpu` drivers.

So far GitHub user [Coreforge](https://github.com/Coreforge) has been able to get the card to display terminal output in color, and with a patched `memcpy.so` library can get GPU acceleration and a window manager loaded, though there are still many small issues.

To get the card working currently, you need to:

  1. Image Pi OS (the older January 2022 copy built on top of Debian 5.10.x) to your Pi.
  2. Compile [Coreforge's GPU branch](https://github.com/Coreforge/linux/pull/1) and copy the built kernel to the Pi.
  3. Install AMD firmware: `sudo apt install -y firmware-amd-graphics`
  4. Set up [this custom memcpy.so](https://gist.github.com/Coreforge/91da3d410ec7eb0ef5bc8dee24b91359) to be preloaded on the system.
  5. Reboot.

Once that's done, you should be able to get Xorg working, or just a console. Note that the driver doesn't seem quite stable yet.

See linked GitHub issue for more details and progress getting the card working.
