---
layout: card
title: "Hailo-8 M.2 AI Accelerator"
picture: "/images/m2-hailo-8-ai-module.jpg"
functionality_cm4: "Untested"
functionality_pi5: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/164"
buy_link: https://hailo.ai/products/ai-accelerators/hailo-8-m2-ai-acceleration-module/
videos:
  - https://www.youtube.com/watch?v=HgIMJbN0DS0
---
The Hailo-8 is an AI accelerator module that is keyed for multiple M.2 pinouts, including M, B+M, and A+E, in sizes ranging from 2230 to 2242, and you can get a model with breakable extensions out to 60 and 80mm deep.

It uses PCIe Gen 3 x2 or x4, and boasts 26 TOPS performance. It's compatible with TensorFLow, TensorFlow Lite, ONNX, Keras, Pytorch, and it should work with Compute Module 4 and Pi 5, though testing will be documented in the linked GitHub issue.

The smaller cousin, the Hailo-8L, is included in Raspberry Pi's [AI Kit](https://www.raspberrypi.com/products/ai-kit/), and use with the Raspberry Pi is documented here: [AI Kit Documentation](https://www.raspberrypi.com/documentation/accessories/ai-kit.html). Hailo maintains example code and more documentation on their GitHub: [hailo-rpi5-examples](https://github.com/hailo-ai/hailo-rpi5-examples).
