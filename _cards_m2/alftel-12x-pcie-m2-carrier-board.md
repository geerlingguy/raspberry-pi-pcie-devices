---
layout: card
title: "Alftel 12x PCI Express M.2 Carrier Board"
picture: "/images/m2-alftel-12x-pcie-m2-carrier-board.jpg"
functionality_cm4: "Full"
functionality_pi5: "Untested"
driver_required: "No"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/80"
buy_link: https://www.tindie.com/products/alftel/pci-express-carrier-board-for-x12-m2-radio-cards/
videos:
  - https://www.youtube.com/watch?v=Ozwyh_Pfe6g
  - https://www.youtube.com/watch?v=AoNxDe1a-X8
---
[Alftel Systems](https://www.alftel.com) sent me this card to do some M.2 device testing, especially with different WiFi cards and Google Coral TPUs.

The board works great, though you need to make sure the power to your Compute Module 4 IO Board is adequate for the number of devices you want to power. I had no problems with a 12V 5A power supply and 4x Coral TPUs plus 4x WiFi cards.

No drivers were required to get this card working, it was just plug-and play.

The card uses [Broadcom's PEX 8619 switch](https://www.broadcom.com/products/pcie-switches-bridges/pcie-switches/pex8619) capable of handling 16 PCI Express Gen 2 (5.0 GT/s) lanes.
