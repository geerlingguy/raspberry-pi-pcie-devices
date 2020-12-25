The Raspberry Pi Compute Module 4 IO Board exposes the Pi's PCI Express 1x lane directly on the board:

<img src="{{ site.url }}/images/cm4-io-board-pcie-slot.jpeg" style="display: block; margin: auto;" width="595" height="300" />

Below is a listing of _all_ the PCIe devices I'm testing on the Pi CM4. I post videos to [my YouTube channel](https://www.youtube.com/c/JeffGeerling) covering many of the cards.

[This project is on GitHub](https://github.com/geerlingguy/raspberry-pi-pcie-devices), and you can follow along with the testing or suggest new things to test there. I also have a few other extra tidbits that may help you in your own card-testing adventures:

  - [Raspberry Pi Linux Cross-compilation Environment](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile)
  - [Instructions for increasing BAR space allocations](https://gist.github.com/geerlingguy/9d78ea34cab8e18d71ee5954417429df)

## Categories
{: .no_toc}

- TOC
{:toc}

### GPUs (Graphics Cards)

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Device</th>
      <th>Functionality</th>
      <th>Driver Required?</th>
      <th>Links</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_gpu %}
    <tr>
      <td>
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="/images/card-pictures/{{ card.picture }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GH Issue</a> | <a href="{{ card.buy_link }}">Buy Card</a></td>
    </tr>
{% endfor %}
  </tbody>
</table>

### USB cards

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Device</th>
      <th>Functionality</th>
      <th>Driver Required?</th>
      <th>Links</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_usb %}
    <tr>
      <td>
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="/images/card-pictures/{{ card.picture }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GH Issue</a> | <a href="{{ card.buy_link }}">Buy Card</a></td>
    </tr>
{% endfor %}
  </tbody>
</table>

### M.2 and NVMe adapters

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Device</th>
      <th>Functionality</th>
      <th>Driver Required?</th>
      <th>Links</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_m2 %}
    <tr>
      <td>
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="/images/card-pictures/{{ card.picture }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GH Issue</a> | <a href="{{ card.buy_link }}">Buy Card</a></td>
    </tr>
{% endfor %}
  </tbody>
</table>

### Network cards (NICs)

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Device</th>
      <th>Functionality</th>
      <th>Driver Required?</th>
      <th>Links</th>
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
      <td><a href="{{ card.github_issue }}">GH Issue</a> | <a href="{{ card.buy_link }}">Buy Card</a></td>
    </tr>
{% endfor %}
  </tbody>
</table>

### SATA cards and storage

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Device</th>
      <th>Functionality</th>
      <th>Driver Required?</th>
      <th>Links</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_storage %}
    <tr>
      <td>
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="/images/card-pictures/{{ card.picture }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GH Issue</a> | <a href="{{ card.buy_link }}">Buy Card</a></td>
    </tr>
{% endfor %}
  </tbody>
</table>

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
