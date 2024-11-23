---
layout: default
title: Home
---
<img src="{{ site.url }}/images/pi-pcie-raspberry-pi-5.jpg" style="display: block; margin: auto;" width="389" height="152" />

The Raspberry Pi has PCI Express! There are some quirks to getting certain devices working with 64-bit Arm (arm64), so [Jeff Geerling](https://www.jeffgeerling.com) started testing PCIe devices on the Compute Module 4 and Pi 5, and is centralizing the resources on this site. Many experiences are documented on [Jeff Geerling's YouTube channel](https://www.youtube.com/c/JeffGeerling)!

[This project is maintained on GitHub](https://github.com/geerlingguy/raspberry-pi-pcie-devices); suggest new cards to test or share your own experiences there.

## More Resources
{: .no_toc}

  - **[Compute Module Products and Boards](boards_cm)**
  - **[Raspberry Pi 5 HATs and Boards](hats)**
  - [Raspberry Pi Linux Cross-compilation Environment](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile)

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
      <th>CM4 Functionality</th>
      <th>Pi 5 Functionality </th>
      <th>Driver Required?</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_gpu %}
    <tr>
      <td class="card_picture_td">
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ card.url }}"><strong>{{ card.title }}</strong></a><br>
        (<a href="{{ card.buy_link }}">Buy this Card</a>)
      </td>
      <td>{{ card.functionality_cm4 }}</td>
      <td>{{ card.functionality_pi5 }}</td>
      <td>{{ card.driver_required }}</td>
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
      <th>CM4 Functionality</th>
      <th>Pi 5 Functionality </th>
      <th>Driver Required?</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_usb %}
    <tr>
      <td class="card_picture_td">
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ card.url }}"><strong>{{ card.title }}</strong></a><br>
        (<a href="{{ card.buy_link }}">Buy this Card</a>)
      </td>
      <td>{{ card.functionality_cm4 }}</td>
      <td>{{ card.functionality_pi5 }}</td>
      <td>{{ card.driver_required }}</td>
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
      <th>CM4 Functionality</th>
      <th>Pi 5 Functionality </th>
      <th>Driver Required?</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_m2 %}
    <tr>
      <td class="card_picture_td">
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ card.url }}"><strong>{{ card.title }}</strong></a><br>
        (<a href="{{ card.buy_link }}">Buy this Card</a>)
      </td>
      <td>{{ card.functionality_cm4 }}</td>
      <td>{{ card.functionality_pi5 }}</td>
      <td>{{ card.driver_required }}</td>
    </tr>
{% endfor %}
  </tbody>
</table>

### Network cards (NICs) and WiFi Adapters

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Device</th>
      <th>CM4 Functionality</th>
      <th>Pi 5 Functionality </th>
      <th>Driver Required?</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_network %}
    <tr>
      <td class="card_picture_td">
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ card.url }}"><strong>{{ card.title }}</strong></a><br>
        (<a href="{{ card.buy_link }}">Buy this Card</a>)
      </td>
      <td>{{ card.functionality_cm4 }}</td>
      <td>{{ card.functionality_pi5 }}</td>
      <td>{{ card.driver_required }}</td>
    </tr>
{% endfor %}
  </tbody>
</table>

### Multimedia (A/V) and sound cards

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Device</th>
      <th>CM4 Functionality</th>
      <th>Pi 5 Functionality </th>
      <th>Driver Required?</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_multimedia %}
    <tr>
      <td class="card_picture_td">
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ card.url }}"><strong>{{ card.title }}</strong></a><br>
        (<a href="{{ card.buy_link }}">Buy this Card</a>)
      </td>
      <td>{{ card.functionality_cm4 }}</td>
      <td>{{ card.functionality_pi5 }}</td>
      <td>{{ card.driver_required }}</td>
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
      <th>CM4 Functionality</th>
      <th>Pi 5 Functionality </th>
      <th>Driver Required?</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_storage %}
    <tr>
      <td class="card_picture_td">
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ card.url }}"><strong>{{ card.title }}</strong></a><br>
        (<a href="{{ card.buy_link }}">Buy this Card</a>)
      </td>
      <td>{{ card.functionality_cm4 }}</td>
      <td>{{ card.functionality_pi5 }}</td>
      <td>{{ card.driver_required }}</td>
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
      <th>CM4 Functionality</th>
      <th>Pi 5 Functionality </th>
      <th>Driver Required?</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_adapter %}
    <tr>
      <td class="card_picture_td">
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ card.url }}"><strong>{{ card.title }}</strong></a><br>
        (<a href="{{ card.buy_link }}">Buy this Card</a>)
      </td>
      <td>{{ card.functionality_cm4 }}</td>
      <td>{{ card.functionality_pi5 }}</td>
      <td>{{ card.driver_required }}</td>
    </tr>
{% endfor %}
  </tbody>
</table>

### Other Cards

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Device</th>
      <th>CM4 Functionality</th>
      <th>Pi 5 Functionality </th>
      <th>Driver Required?</th>
    </tr>
  </thead>
  <tbody>
{% for card in site.cards_other %}
    <tr>
      <td class="card_picture_td">
        {% if card.picture %}
          <a href="{{ card.url }}"><img class="card_table_picture" src="{{ card.picture | image_thumbnail }}" alt="{{ card.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ card.url }}"><strong>{{ card.title }}</strong></a><br>
        (<a href="{{ card.buy_link }}">Buy this Card</a>)
      </td>
      <td>{{ card.functionality_cm4 }}</td>
      <td>{{ card.functionality_pi5 }}</td>
      <td>{{ card.driver_required }}</td>
    </tr>
{% endfor %}
  </tbody>
</table>

## About
{: .no_toc}

[![GitHub Stats](https://github-readme-stats.vercel.app/api/pin?username=geerlingguy&repo=raspberry-pi-pcie-devices&show_icons=true&hide_border=true&show_owner=true&theme=graywhite)](https://github.com/geerlingguy/raspberry-pi-pcie-devices)

This project is maintained by [Jeff Geerling](https://www.jeffgeerling.com). The Raspberry Pi is a products of [Raspberry Pi Ltd](https://www.raspberrypi.com/about/).

> Many of the device links on this page are Amazon affiliate links. If you do not wish to use those links, copy the device name to search for it at any major electronics retailer (e.g. [Newegg](https://www.newegg.com), [Micro Center](https://www.microcenter.com), [Amazon](https://www.amazon.com), etc.).
