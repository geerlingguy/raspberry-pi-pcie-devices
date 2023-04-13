---
layout: card
title: "ASRock Rack M2_VGA"
picture: "/images/gpu-asrock-rack-m2-vga.jpg"
functionality: "Partial"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/62"
buy_link: https://www.asrockrack.com/general/productdetail.asp?Model=M2_VGA
videos:
  - https://www.youtube.com/watch?v=crnEygp4C6g
  - https://www.youtube.com/watch?v=MxcafwjWw24
  - https://www.youtube.com/watch?v=l9dItRUjQ0k
---
The M2_VGA is a tiny M.2 form-factor video card that features the SM750 GPU. This GPU doesn't have a 3D rendering engine, it only has 16 MB of RAM, and it's meant more for basic graphics like you'd find in a kiosk or an appliance—or as a very simple and power-efficient graphics processor for a server.

It requires an M.2 M-key to PCI express adapter (like the MZHOU adapter I used) to plug into the 1x PCIe slot on the CM4 IO Board.

The card also requires a separate 4-pin molex power source, so I used a separate Molex power adapter to supply power to the board; you could also jumper power to it from the IO board if you're so inclined, but figuring that out is up to you :)

The SM750 GPU chip requires a driver to operate, and there is an open source driver in the Linux kernel 'staging' directory. The driver [has been panned](https://www.phoronix.com/scan.php?page=news_item&px=MTA2OTk) by some as having poor coding practices, and has not been updated to use the `drm` subsystem in Linux, so it could take some work to get it working... but let's give it a try!

### `sm750fb` (open source) driver

To get the sm750fb driver loaded, you have to [recompile the Linux kernel for Pi OS](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile).

Go to `Device Drivers` > `Graphics support` on the `menuconfig` step, and select the `Silicon Motion SM750 framebuffer support` driver to install.

Before you compile the kernel, apply [this patch](https://patch-diff.githubusercontent.com/raw/geerlingguy/linux/pull/2.diff) to your Linux checkout.

After copying over the new kernel and modules, and rebooting, the Pi should be able to at least boot to the console. Xorg and other window managers don't seem to work.

See the linked GitHub issue for more details.
