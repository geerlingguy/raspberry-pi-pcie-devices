---
layout: card
title: "Rosewill RC-20001 2.5GBASE-T PCIe x1 Network Adapter"
picture: "/images/network-rosewill-rc20001.jpg"
functionality_cm4: "Full"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/40"
buy_link: https://amzn.to/3nJPXP9
videos:
  - https://www.youtube.com/watch?v=wCbQQ5-sjGM
  - https://www.youtube.com/watch?v=vBccak8f-VY
  - https://www.youtube.com/watch?v=KhHAf7mTxkk
---
This adapter works great with the Pi in the built-in 1x PCIe slot on the IO Board. I tried installing the Realtek drivers from their website but had difficulty compiling them.

So instead I [cross-compiled the Pi OS kernel](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) and used menuconfig to select the right driver to build:

```
Device Drivers
  > Network device support
    > Ethernet driver support
      > Realtek devices
        > Realtek 8169/8168/8101/8125 ethernet support
```

After compiling the kernel and moving it to the Pi, I rebooted and the card was identified as `eth1`. It connected fine to my 1 Gbps network, as well as my 10 Gbps network through a [MikroTik switch](https://amzn.to/3mRSs0I) (at 2.5 Gbps).

To get full 2.5 Gbps throughput, I had to enable Jumbo Frames (MTU 9000) using `sudo ip link set dev eth1 mtu 9000` and make sure all the other devices on the network path supported Jumbo Frames.

Otherwise, you are limited to around 1.9 Gbps without an overclock on the Pi, due to IRQ interrupts.

See this blog post for more details: [Testing 2.5 Gbps Ethernet on the Raspberry Pi CM4](https://www.jeffgeerling.com/blog/2020/testing-25-gbps-ethernet-on-raspberry-pi-cm4).
