---
layout: card
title: "Coral M.2 Accelerator with Dual Edge TPU"
picture: "/images/m2-coral-m2-accelerator-dual-edge-tpu.jpeg"
functionality: "Currently Testing"
driver_required: "Maybe"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/318"
buy_link: https://coral.ai/products/m2-accelerator-dual-edgetpu/
videos: []
---
The [Coral M.2 Accelerator with Dual Edge TPU](https://coral.ai/products/m2-accelerator-dual-edgetpu/) uses an interesting feature of M.2 E-key slots—it uses both lanes that are in the spec to the slot (though most board manufacturers only implement one lane per slot).

The Seaberry board comes with slots that implement both lanes per M.2 E-key slot, though, so this card could work if the device supports it. Sadly, as we've seen with the single TPU ([see issue #44](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/44)), the Compute Module 4's PCIe implementation is currently incompatible with the Coral PCIe driver.

But other boards like Radxa's CM3 and Pine64's SOQuartz (both of which use a RockChip SoC) might work with it...
