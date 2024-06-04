---
layout: card
title: "Coral M.2 Accelerator with Dual Edge TPU"
picture: "/images/m2-coral-m2-accelerator-dual-edge-tpu.jpeg"
functionality_cm4: "None"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/318"
buy_link: https://coral.ai/products/m2-accelerator-dual-edgetpu/
videos:
  - https://www.youtube.com/watch?v=HgIMJbN0DS0
---
The [Coral M.2 Accelerator with Dual Edge TPU](https://coral.ai/products/m2-accelerator-dual-edgetpu/) uses an interesting feature of M.2 E-key slots—it uses both lanes that are in the spec to the slot (though most board manufacturers only implement one lane per slot).

There are only a two ways to use this Dual Edge TPU with a Pi natively right now:

  - Pineboards makes a [Dual Edge TPU HAT](https://pineboards.io/products/hat-ai-dual-edge-coral-tpu-bundle-for-raspberry-pi-5) which uses a PCIe switch to connect two PCIe lanes to an E-key M.2 slot for the Dual Edge TPU specifically.
  - The [Seaberry Mini ITX board for CM4](https://pipci.jeffgeerling.com/boards_cm/seaberry.html) comes with slots that implement both lanes per M.2 E-key slot. But the CM4's PCIe implementation seems incompatible with any Coral TPU ([see issue #44](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/44))

The Raspberry Pi 5 model B may work with it, but right now testing is devoted to the single TPU model, since there are currently no HATs available with a dual-lane M.2 E-key slot (and it's likely there never _will_ be one, unless we can get the singl TPU model working reliably).
