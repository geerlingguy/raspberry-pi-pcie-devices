---
layout: card
title: "MikroTik CCR2004-1G-2XS-PCIe"
picture: "/images/network-mikrotik-ccr2004-1g-2xs-pcie.jpg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/477"
buy_link: https://www.streakwave.com/mikrotik-ccr2004-1g-2xs-pcie-cloud-core-router-2004-pcie-adapter
videos: []
---

The MikroTik [CCR2004-1G-2XS-PCIe](https://mikrotik.com/product/ccr2004_1g_2xs_pcie) is a SmartNIC/Router-NIC/poor man's [DPU](https://en.wikipedia.org/wiki/Data_processing_unit) equipped with:

- 2x 25G SFP28 network ports
- 1x 10M/100M/1G management port
- An Annapurna Labs (Amazon) AL52400 SmartNIC SoC (quad-core Cortex-A57[^1] @ 1.5GHz)
- 4GB of RAM + 128MiB parallel NAND (why, MikroTik? a 4-8GB eMMC costs the same, and would let you run containers on it...)

[^1] may actually be Cortex-A72

The card runs MikroTik RouterOS; the three network ports are attached to the AL52400 SoC, which is the same SoC Amazon used in the ~third generation of their [AWS Nitro](https://aws.amazon.com/ec2/nitro/) network and storage virtualization system cards.

---

The card presents itself as four Atheros AR8151 PCIe Gigabit Ethernet NICs - the PCIe lanes connect to the SoC, which emulates the AR8151 hardware.

MikroTik added support for [multiple TX/RX queues](https://lore.kernel.org/all/20210527144423.3395719-1-gatis@mikrotik.com/t/#u) and [10G/25G link speeds](https://lore.kernel.org/all/20210513114326.699663-1-gatis@mikrotik.com/t/#u) to the kernel's `atl1c` driver to support this.

Testing this card requires the Atheros L1C driver to be compiled into the Pi OS kernel. Because it is not included by default, you need to recompile the kernel with the following option enabled through `menuconfig`:

```
Device Drivers
  -> Network device support
    -> Ethernet driver support
      -> Atheros Devices
        -> Atheros L1C Gigabit Ethernet support
```

You will also need to add the following line to `/boot/config.txt` to enable 32-bit DMA transfers:

```
dtoverlay=pcie-32bit-dma
```

Any of the four PCIe vNIC ports can be directly mapped to either of the SFP28 ports in "passthrough mode", leaving two ports free to communicate with the SoC, or all six ports can be used as regular routed/bridged ports in RouterOS as normal. 

Performance is in line with other high-speed NICs, able to achieve somewhere slightly north of 3Gbps throughput. Passthrough mode vs. bridged mode does not affect performance here as the limiter is the CM4's PCIe interface.

---

`lspci -vvv` output (NICs 2-4 trimmed for brevity:)

```
01:00.0 Ethernet controller: Qualcomm Atheros AR8151 v2.0 Gigabit Ethernet
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 65
        Region 0: Memory at 600000000 (64-bit, non-prefetchable) [size=64K]
        Capabilities: [40] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [70] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0.000W
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x8, ASPM not supported
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 5GT/s (downgraded), Width x1 (downgraded)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
                         10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
                         FRS- TPHComp+ ExtTPHComp-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
                LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [d0] Vital Product Data
                Not readable
        Capabilities: [100 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP- SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [148 v1] Device Serial Number 00-00-00-00-00-00-00-00
        Capabilities: [158 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [178 v5] Extended Capability ID 0x905
        Kernel driver in use: atl1c
        Kernel modules: atl1c

01:00.1 Ethernet controller: Qualcomm Atheros AR8151 v2.0 Gigabit Ethernet
[...]
01:00.2 Ethernet controller: Qualcomm Atheros AR8151 v2.0 Gigabit Ethernet
[...]
01:00.3 Ethernet controller: Qualcomm Atheros AR8151 v2.0 Gigabit Ethernet
```

Test setup photo:

![IMG_2631](https://user-images.githubusercontent.com/4232981/187349894-a49815be-aa75-48e6-aa99-0f0943d212e1.jpeg)

