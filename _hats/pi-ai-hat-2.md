---
layout: hat
title: "Raspberry Pi AI HAT+ 2"
short_description: AI HAT with Hailo-10H AI accelerator and 8GB of on‑board RAM
status: production
picture: "/images/hat-pi-ai-hat-2.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/794"
link: "https://www.raspberrypi.com/products/ai-hat-plus-2/"
videos:
  - https://www.youtube.com/watch?v=jRQaur0LdLE
---
The Raspberry Pi AI HAT+ 2 features a Hailo-10H processor and 8GB of LPDDR5 RAM, allowing it to run larger inference models without loading them onto the Pi's internal RAM.

The processor is a little slower for most LLMs (which fit within 8GB of RAM) than the CPU on the Pi 5 itself, but can free the Pi 5's CPU for other tasks.

It also has equivalent vision processing performance to the earlier AI HAT+, so for mixed machine vision + inference tasks, this could be a useful addition.
