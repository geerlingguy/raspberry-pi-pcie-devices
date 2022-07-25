---
layout: card
title: "SimCom SIM8200EA-M2"
picture: "/images/network-sim8200ea-m2.jpg"
functionality: "Currently Testing"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/442"
buy_link: https://www.simcom.com/product/SIM8200EA_M2.html
videos: []
---
From @shayne on GitHub:

I've pulled together the hardware and software required to run the SIM8200EA (8200) modem on a CM4 platform using the Waveshare CM4-DUAL-ETH-4G/5G-BASE (Base Board).

Hardware:

- [CM4-DUAL-ETH-4G/5G-BASE](https://www.waveshare.com/product/cm4-dual-eth-4g-5g-box.htm) - Base board and case
- [CM4008000](https://www.seeedstudio.com/Raspberry-Pi-Compute-Module-CM4008000-p-5221.html) - RaspberryPi
- [SIM8200EA_M2](https://www.simcom.com/product/SIM8200EA_M2.html) - 5G modem

Software:

- [OpenWrt 21.02.3](https://openwrt.org/) - custom compiled with qmi_wwan_simcom 8200 specific driver support
- Standard [QMI](https://openwrt.org/docs/guide-user/network/wan/wwan/ltedongle) connection via OpenWrt proto (i.e. not using [simcom-cm](https://github.com/geerlingguy/raspberry-pi-pcie-devices/files/8656232/simcom-cm.tar.gz) dialer binary)
- Modified [qmi_wwan.c](https://github.com/geerlingguy/raspberry-pi-pcie-devices/files/8656219/qmi_wwan_MODIFIED_FOR_8200.c.gz) (adds support for 8200, ✅ using in my setup)
- SIMCOM provided driver: [qmi_wwan_simcom.c](https://github.com/geerlingguy/raspberry-pi-pcie-devices/files/8656222/qmi_wwan_simcom.tar.gz)
- Kernel config [patch](https://github.com/geerlingguy/raspberry-pi-pcie-devices/files/8656239/kernel_config_patch.txt)

Results:

- I've experienced speeds in excess of 600mbps down and 400mbps up! [example speedtest](https://www.speedtest.net/result/c/ab2c4d36-4f14-46f7-b4dc-174b4ce042ad)
- Connection has maintained for several days now, seems solid?


See the [GitHub issue](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/442) for more information and updates.
