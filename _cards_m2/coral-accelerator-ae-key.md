---
layout: card
title: "Google Coral TPU M.2 Accelerator A+E Key"
picture: "/images/m2-coral-accelerator-ae-key.jpg"
functionality_cm4: "None"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/44"
buy_link: https://amzn.to/3jWowRg
videos:
  - https://www.youtube.com/watch?v=HgIMJbN0DS0
---
Coral TPU accelerators offer an easy way to add advanced (and fast!) ML and AI coprocessors to embedded devices. You can use them for things like image recognition, and they are integrated into popular software like Frigate.

The PCIe version of the Google Coral completely locks up on the Compute Module 4, though the [USB TPU version](https://amzn.to/3qGR2sE) works.

On the Raspberry Pi 5, I am able to follow the [install guide for PCIe](https://coral.ai/docs/m2/get-started), but there are a few configuration tweaks you need to make to get the TPU working correctly, and you can't use the system Python (3.11) on Pi OS 12 because it is too new for PyCoral.

See my [blog post on getting the Coral TPU working on Pi 5](https://www.jeffgeerling.com/blog/2023/pcie-coral-tpu-finally-works-on-raspberry-pi-5) for more details.

Follow the GitHub issue for more details.
