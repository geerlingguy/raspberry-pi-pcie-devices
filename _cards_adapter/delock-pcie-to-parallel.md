---
layout: card
title: "Delock PCI Express Card to 1x Parallel IEEE 1284"
picture: "/images/adapter-delock-pcie-to-parallel.jpg"
functionality_cm4: "None"
functionality_pi5: "Untested"
driver_required: "N/A"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/54"
buy_link: https://amzn.to/3dFithZ
videos: []
---
A number of parallel port adapters for PCI Express were tried on the Compute Module 4, but all that were tested required IO BAR space mapping to work correctly, and that legacy feature is not supported on the Pi's SoC. So far no parallel port adapter has been found to work on the CM4.
