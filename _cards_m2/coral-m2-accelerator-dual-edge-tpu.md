---
layout: card
title: "Coral M.2 Accelerator with Dual Edge TPU"
picture: "/images/m2-coral-m2-accelerator-dual-edge-tpu.jpeg"
functionality_cm4: "None"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/318"
buy_link: https://coral.ai/products/m2-accelerator-dual-edgetpu/
videos: []
---
The [Coral M.2 Accelerator with Dual Edge TPU](https://coral.ai/products/m2-accelerator-dual-edgetpu/) uses an interesting feature of M.2 E-key slots—it uses both lanes that are in the spec to the slot (though most board manufacturers only implement one lane per slot).

The Seaberry board comes with slots that implement both lanes per M.2 E-key slot, though, so this card could work if the device supports it. Sadly, as we've seen with the single TPU ([see issue #44](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/44)), the Compute Module 4's PCIe implementation is currently incompatible with the Coral PCIe driver.

Other CM4-pinout-compatible boards _might_ work with it (but nobody's had success yet).

The Raspberry Pi 5 model B may work with it, but right now testing is devoted to the single TPU model, since there are currently no HATs available with a dual-lane M.2 E-key slot (and it's likely there never _will_ be one, unless we can get the singl TPU model working reliably).
