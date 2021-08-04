---
layout: card
title: "IOCrest JMB585 PCIe Gen3 SATA Controller"
picture: "/images/storage-iocrest-sata-5-port-jmb585.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/64"
buy_link: https://amzn.to/3rkbK1d
videos:
  - https://www.youtube.com/watch?v=vBccak8f-VY
  - https://www.youtube.com/watch?v=KhHAf7mTxkk
---
Since mid-2021, [SATA support is built into the Raspberry Pi kernel](https://www.jeffgeerling.com/blog/2021/raspberry-pi-os-now-has-sata-support-built), so assuming you have updated to the latest version (`sudo apt upgrade -y`), this card should work out of the box.

The card shows up as `SATA controller: JMicron Technology Corp. Device 0585 (prog-if 01 [AHCI 1.0])` using `lspci`, and I successfully tested four drives connected to it (I didn't have any more to test, otherwise I would've plugged in a fifth!).

The card was able to pump through around 395-400 MiB/sec of data when doing a RAID 5 parity calculation, and I could regularly get 350 MiB/sec of performance when just copying data among the drives.

Any kind of RAID setup will require software RAID, which relies on the slow(ish) Pi CPU to work. So parity calculations can make RAID writes fairly slow, even on fast disks.

I successfully tested this card with Open Media Vault and had no issues.
