The Raspberry Pi Compute Module 4 IO Board exposes the Pi's PCI Express 1x lane directly on the board:

<img src="{{ site.url }}/images/cm4-io-board-pcie-slot.jpeg" style="display: block; margin: auto;" width="595" height="300" />

I'm on a mission to test out these and _many_ more PCIe cards on the Pi, and see what works, what doesn't, and what I can learn.

<img src="{{ site.url }}/images/cm4-pcie-cards.jpeg" style="display: block; margin: auto;" width="600" height="390" />

Below is a listing of _all_ the PCIe devices I've tested so far.

I post videos with a lot more detail for many of the devices, like my [Raspberry Pi Compute Module 4 Review](https://www.jeffgeerling.com/blog/2020/raspberry-pi-compute-module-4-review) and more on my [YouTube channel](https://www.youtube.com/c/JeffGeerling).

[This project is on GitHub](https://github.com/geerlingguy/raspberry-pi-pcie-devices), and you can follow along with the testing or suggest new things to test there.

## Categories
{: .no_toc}

- TOC
{:toc}

### GPUs (Graphics Cards)

| Device | Functionality | Driver required? | Notes |
| ------ | ------------- | ---------------- | ----- |
| [Zotac GeForce GT 710 1GB PCIe x1](https://amzn.to/3mdy1LE) | None | Yes | Drivers for ARM: [32-bit](https://www.nvidia.com/en-us/drivers/unix/linux-arm-display-archive/), [64-bit](https://www.nvidia.com/en-us/drivers/unix/linux-aarch64-archive/). Nouveau driver requires compilation. Requires extra [BAR space](https://gist.github.com/geerlingguy/9d78ea34cab8e18d71ee5954417429df). More details: [Issue #2](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/2). |
| [VisionTek Radeon 5450 1GB PCIe x16](https://amzn.to/2Hh6KcI) | None | Yes | Needs [x1 to x16 cable](https://amzn.to/2ThfzFD). Radeon driver requires compilation (incompatible with amdgpu). Requires extra [BAR space](https://gist.github.com/geerlingguy/9d78ea34cab8e18d71ee5954417429df). More details: [Issue #4](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/4). |
| [Sapphire Radeon RX 550 2GB PCIe x16](https://amzn.to/34vadwW) | [Currently Testing](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/6)) | Yes | Needs [x1 to x16 powered adapter](https://amzn.to/3dZQM2u). AMDGPU driver requires compilation. Requires extra [BAR space](https://gist.github.com/geerlingguy/9d78ea34cab8e18d71ee5954417429df). More details: [Issue #6](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/6).
| [EVGA GeForce GTX 750 Ti](https://amzn.to/3l2rrXs) | [Currently Testing](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/26) | Yes | Needs [x1 to x16 powered adapter](https://amzn.to/3dZQM2u). Nouveau driver requires compilation. Requires extra [BAR space](https://gist.github.com/geerlingguy/9d78ea34cab8e18d71ee5954417429df). More details: [Issue #26](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/26).

### USB cards

| Device | Functionality | Driver required? | Notes |
| ------ | ------------- | ---------------- | ----- |
| [Syba SD-PEX20199 PCIe x1 USB 3.1 & 3.0 adapter](https://amzn.to/31yArwD) | Full | No | N/A |
| [Inateck PCIe x1 USB 3.0 adapter](https://amzn.to/3oplt67) | Limited | No | Sometimes mounted devices at 5 Gbps, other times at 480 Mbps. |
| [A ADWITS PCIe 1x 'PCI Experss' USB 3.0 adapter with VL805](https://amzn.to/37CKTHr) | Limited | No | Sometimes mounted devices at 5 Gbps, other times at 480 Mbps. Requires external [5v DC 4-pin Molex power supply](https://amzn.to/37Cy0NA). |

### NVMe adapters

| Device | Functionality | Driver required? | Notes |
| ------ | ------------- | ---------------- | ----- |
| [NGFF M.2 M Key SSD to PCIe 1x Adapter](https://amzn.to/37tfWW1) | Full | No | Tested with [Samsung 970 EVO Plus](https://amzn.to/3mfJM4a). |
| [MZHOU NVMe M.2 SSD M Key to PCIe 1x Adapter](https://amzn.to/3maJ6NF) | Full | No | Tested with [Samsung 970 EVO Plus](https://amzn.to/3mfJM4a). |
| [Xiwai NGFF M Key M.2 SSD to PCIe 1x Adapter](https://amzn.to/3ogoQvL) | Full | No | Tested with [Samsung 970 EVO Plus](https://amzn.to/3mfJM4a). |

### Network cards (NICs)

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Device</th>
      <th>Functionality</th>
      <th>Driver Required?</th>
      <th>Issue Link</th>
      <th>Buy Link</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_network %}
    <tr>
      <td>
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="/images/card-pictures/{{ card.picture }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GitHub Issue</a></td>
      <td><a href="{{ card.buy_link }}">Buy Card</a></td>
    </tr>
{% endfor %}
  </tbody>
</table>

### SATA cards and storage

| Device | Functionality | Driver required? | Notes |
| ------ | ------------- | ---------------- | ----- |
| [IO Crest 4 Port SATA III PCIe x1 with Marvell 9215](https://amzn.to/2HpEWCP) | Full | Yes | Requires kernel recompile with `CONFIG_ATA` and `CONFIG_SATA_AHCI`. More details: [Issue #1](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/1). |
| [IBM ServeRAID BR10i / LSI SAS3082E-R SAS RAID controller](https://amzn.to/2GVMZae) | Currently Testing | Maybe | Having trouble initializing. More details: [Issue #18](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/18). |
| [Teratrend 2-port SATA-III Marvell 88SE9130](http://www.computex.biz/teratrend/default.aspx?com_id=6828&pdt_id=48154&PageType=ProductDetail&ContentTab=Specification) | Currently Testing | Maybe | More details: [Issue #29](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/29). |
| [4-port (2-active) ASM1061 SATA adapter](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/30) | Currently Testing | Maybe | More details: [Issue #30](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/30). |

### PCIe Switches and Adapters

| Device | Functionality | Driver required? | Notes |
| ------ | ------------- | ---------------- | ----- |
| [I/O Crest SI-PEX60016 1 to 2 Port PCIe Switch](https://amzn.to/2Ie0bI3) | Currently Testing | No | More details: [Issue #14](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/14). |
| [Exacq Technologies TI XIO3130 1 to 2 Port PCIe Switch](https://www.ti.com/product/XIO3130) | Currently Testing | No | More details: [Issue #14](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/14). |
| [HLT PCIe 1x to 16x extension cable](https://amzn.to/32oz9ou) | Full | No | More details: [Issue #14](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/14). |
| [Rosewill RCRC-17001 Mining Card 1x to 16x](https://www.newegg.com/p/N82E16812119888?Item=9SIA85VAN30509) | Currently Testing | No | More details: [Issue #14](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/14). |
| [PCE164P-N06 VER008S PCIe 1x to 16x riser](https://amzn.to/3oslmpo) | Currently Testing | No | More details: [Issue #14](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/14). |

## About
{: .no_toc}

[![GitHub Stats](https://github-readme-stats.vercel.app/api/pin?username=geerlingguy&repo=raspberry-pi-pcie-devices&show_icons=true&hide_border=true&show_owner=true&theme=graywhite)](https://github.com/geerlingguy/raspberry-pi-pcie-devices)

This project is maintained by [Jeff Geerling](https://www.jeffgeerling.com). The Raspberry Pi Compute Module 4 is a product of [Raspberry Pi (Trading) Limited](https://www.raspberrypi.org/about/).

> Many of the device links on this page are Amazon affiliate links. If you do not wish to use those links, copy the device name to search for it at any major electronics retailer (e.g. [Newegg](https://www.newegg.com), [Micro Center](https://www.microcenter.com), [Amazon](https://www.amazon.com), etc.).
