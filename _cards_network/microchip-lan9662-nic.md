---
layout: card
title: "Microchip LAN9662-NIC PCIe"
picture: "/images/network-lan9662-nic.png"
functionality_cm4: "Full"
functionality_pi5: "Untested"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/807"
buy_link: https://www.microchip.com/en-us/development-tool/ev53u25a
videos: []
---

The Microchip [LAN9662](https://www.microchip.com/en-us/product/lan9662) is 4-Port **TSN Gigabit Ethernet Switch** with End-Point.

- Copper Support:10/100/1000 (2)
- DownstreamPorts:4
- Port Speed:10/100/1000/2500Mbps
- Fiber Support:1000X 2500X (2)

The official RPi OS doesn't natively support LAN966x PCIe, so a build is needed to bridge that gap by compiling Microchip's Linux kernel fork with the necessary drivers and configurations, allowing users to run a full-featured Raspberry Pi OS alongside the LAN966x switch hardware.

While Microchip provides a basic Board Support Package (BSP), it lacks the full richness of the standard Raspberry Pi OS ecosystem, things like package management, and familiar tooling.

Integration Guide:
### [https://github.com/gpmanly/rpi-cm4-lan966x](https://github.com/gpmanly/rpi-cm4-lan966x)

Verification:

Show Linux Version
```shell
uname –a

#It should return the following
Linux raspberrypi 6.12.48-v8+ #36 SMP PREEMPT Mon Mar  2 15:18:32 PST 2026 aarch64 GNU/Linux
```
Show that the LAN966x driver is loaded and enumerated.
```shell
$ lspci -vv
```
It should return **`Kernel driver in use: microchip_lan966x_pci`**:
```shell
lspci -vv
00:00.0 PCI bridge: Broadcom Inc. and subsidiaries BCM2711 PCIe Bridge (rev 20) (prog-if 00 [Normal decode])
        Device tree node: /sys/firmware/devicetree/base/scb/pcie@7d500000/pci@0,0
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 19
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
        Memory behind bridge: 00000000-043fffff [size=68M] [32-bit]
        Prefetchable memory behind bridge: [disabled] [64-bit]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity- SERR- NoISA- VGA- VGA16- MAbort- >Reset- FastB2B- 
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: <access denied>
        Kernel driver in use: pcieport

01:00.0 Ethernet controller: Microchip Technology / SMSC Device 9660
        Subsystem: Microchip Technology / SMSC Device 9660
        Device tree node: /sys/firmware/devicetree/base/scb/pcie@7d500000/pci@0,0/switch@0,0
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 19
        Region 0: Memory at 600000000 (32-bit, non-prefetchable) [size=32M]  
        Region 1: Memory at 602000000 (32-bit, non-prefetchable) [size=16M]
        Region 2: Memory at 603000000 (32-bit, non-prefetchable) [size=8M]   
        Region 3: Memory at 603800000 (32-bit, non-prefetchable) [size=8M]   
        Region 4: Memory at 604000000 (32-bit, non-prefetchable) [size=128K] 
        Region 5: Memory at 604020000 (32-bit, non-prefetchable) [size=8K]   
        Capabilities: <access denied>
        Kernel driver in use: microchip_lan966x_pci
```
IP Command
```shell
$ ip a
```
Returns:
```shell
$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether d8:3a:dd:db:e2:99 brd ff:ff:ff:ff:ff:ff
    inet 10.161.140.95/24 brd 10.161.140.255 scope global dynamic noprefixroute eth0
       valid_lft 6768sec preferred_lft 6768sec
    inet6 fe80::902:abcd:669d:8f2c/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether f6:8c:d7:1d:08:d1 brd ff:ff:ff:ff:ff:ff
    inet 10.0.1.2/32 scope global eth1
       valid_lft forever preferred_lft forever
4: eth2: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
    link/ether f6:8c:d7:1d:08:d2 brd ff:ff:ff:ff:ff:ff
5: eth3: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
    link/ether f6:8c:d7:1d:08:d3 brd ff:ff:ff:ff:ff:ff
6: eth4: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
    link/ether f6:8c:d7:1d:08:d4 brd ff:ff:ff:ff:ff:ff
7: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether d8:3a:dd:db:e2:9a brd ff:ff:ff:ff:ff:ff
```
Ethtool Command
```shell
$ ethtool -i eth1
```
Returns:
```shell
driver: lan966x-switch
version: 6.12.48-v8+
firmware-version:
expansion-rom-version:
bus-info: 602000000.switch
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no
```
Test the Ethernet interface.
Connect the Ethernet to a link partner and then ping:
```shell
# Assign address to eth1
$ sudo ip addr add 10.0.1.2/24 dev eth1

# Ping the link partner
$ ping 10.0.1.3 -I eth1
PING 10.0.1.3 (10.0.1.3) from 10.0.1.2 eth1: 56(84) bytes of data.
64 bytes from 10.0.1.3: icmp_seq=1 ttl=128 time=1.73 ms
64 bytes from 10.0.1.3: icmp_seq=2 ttl=128 time=1.82 ms
64 bytes from 10.0.1.3: icmp_seq=3 ttl=128 time=1.81 ms
64 bytes from 10.0.1.3: icmp_seq=4 ttl=128 time=1.59 ms
64 bytes from 10.0.1.3: icmp_seq=5 ttl=128 time=1.65 ms
^C
--- 10.0.1.3 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4006ms
rtt min/avg/max/mdev = 1.591/1.718/1.819/0.088 ms
```

```shell
# IPERF TEST
$ iperf -c 10.0.1.3
------------------------------------------------------------
Client connecting to 10.0.1.3, TCP port 5001
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 10.0.1.2 port 41082 connected with 10.0.1.3 port 5001
[ ID] Interval       Transfer     Bandwidth
[  1] 0.0000-10.0168 sec   740 MBytes   619 Mbits/sec
```

Test Setup Photo:
![IMG_1](https://github.com/gpmanly/rpi-cm4-lan966x/blob/c9a0b6df4a0be7eb1362278a6bf840eefd1ee6a7/lan9662-rpicm4.png)

Screenshot of the Result:
![IMG_2](https://github.com/gpmanly/rpi-cm4-lan966x/blob/c9a0b6df4a0be7eb1362278a6bf840eefd1ee6a7/results.png)