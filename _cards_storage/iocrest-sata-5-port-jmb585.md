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
I had to [cross-compile](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile) the Pi OS kernel to get the driver and SATA support required to make this card work. When running `menuconfig`, I selected the following options:

```
> Device Drivers
  > Serial ATA and Parallel ATA drivers (libata) (enable this - M)
    > AHCI SATA support (enable this - M)
    > Marvell SATA support (enable this - M)
```

The card shows up as `SATA controller: JMicron Technology Corp. Device 0585 (prog-if 01 [AHCI 1.0])` using `lspci`, and I successfully tested four drives connected to it (I didn't have any more to test, otherwise I would've plugged in a fifth!).

The card was able to pump through around 395-400 MiB/sec of data when doing a RAID 5 parity calculation, and I could regularly get 350 MiB/sec of performance when just copying data among the drives.

Any kind of RAID setup will require software RAID, which relies on the slow(ish) Pi CPU to work. So parity calculations can make RAID writes fairly slow, even on fast disks.

I successfully tested this card with Open Media Vault and had no issues.
