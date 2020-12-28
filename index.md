---
layout: default
title: Home
---
<img src="{{ site.url }}/images/cm4-io-board-pcie-slot.jpeg" style="display: block; margin: auto;" width="595" height="300" />

The Raspberry Pi Compute Module 4 IO Board exposes the Pi's PCI Express 1x lane directly on the board. I'm ([Jeff Geerling](https://www.jeffgeerling.com)) testing many PCIe cards with the Pi and adding them to the listing below. Also check out videos about them on [my YouTube channel](https://www.youtube.com/c/JeffGeerling)!

[This project is maintained on GitHub](https://github.com/geerlingguy/raspberry-pi-pcie-devices); suggest new cards to test or share your own experiences there. These helpful resources can help you in your own PCIe testing on the Pi:

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
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GitHub Issue</a><br>
<a href="{{ card.buy_link }}">Buy Card</a></td>
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
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GitHub Issue</a><br>
<a href="{{ card.buy_link }}">Buy Card</a></td>
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
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GitHub Issue</a><br>
<a href="{{ card.buy_link }}">Buy Card</a></td>
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
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GitHub Issue</a><br>
<a href="{{ card.buy_link }}">Buy Card</a></td>
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
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GitHub Issue</a><br>
<a href="{{ card.buy_link }}">Buy Card</a></td>
    </tr>
{% endfor %}
  </tbody>
</table>

### PCIe Switches and Adapters

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
{% for card in site.cards_adapter %}
    <tr>
      <td>
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td><a href="{{ card.url }}">{{ card.title }}</a></td>
      <td>{{ card.functionality }}</td>
      <td>{{ card.driver_required }}</td>
      <td><a href="{{ card.github_issue }}">GitHub Issue</a><br>
<a href="{{ card.buy_link }}">Buy Card</a></td>
    </tr>
{% endfor %}
  </tbody>
</table>

## About
{: .no_toc}

[![GitHub Stats](https://github-readme-stats.vercel.app/api/pin?username=geerlingguy&repo=raspberry-pi-pcie-devices&show_icons=true&hide_border=true&show_owner=true&theme=graywhite)](https://github.com/geerlingguy/raspberry-pi-pcie-devices)

This project is maintained by [Jeff Geerling](https://www.jeffgeerling.com). The Raspberry Pi Compute Module 4 is a product of [Raspberry Pi (Trading) Limited](https://www.raspberrypi.org/about/).

> Many of the device links on this page are Amazon affiliate links. If you do not wish to use those links, copy the device name to search for it at any major electronics retailer (e.g. [Newegg](https://www.newegg.com), [Micro Center](https://www.microcenter.com), [Amazon](https://www.amazon.com), etc.).
