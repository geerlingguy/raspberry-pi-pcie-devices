---
layout: card
title: "Google Coral TPU M.2 Accelerator A+E Key"
picture: "/images/m2-coral-accelerator-ae-key.jpg"
functionality_cm4: "None"
functionality_pi5: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/44"
buy_link: https://amzn.to/3jWowRg
videos: []
---
Coral TPU accelerators offer an easy way to add advanced (and fast!) ML and AI coprocessors to embedded devices. You can use them for things like image recognition, and they are integrated into popular software like Frigate.

The PCIe version of the Google Coral completely locks up on the Compute Module 4, though the [USB TPU version](https://amzn.to/3qGR2sE) works.

On the Raspberry Pi 5, I am able to follow the [install guide for PCIe](https://coral.ai/docs/m2/get-started), and have the device recognized.

But with Pi OS 12 (Bookworm), the system Python version is too new for the `pycoral` library. So I've been [testing my Coral TPU using Docker](https://www.jeffgeerling.com/blog/2023/testing-coral-tpu-accelerator-m2-or-pcie-docker), but I am still running into some issues.

Please follow the GitHub issue for more details.
