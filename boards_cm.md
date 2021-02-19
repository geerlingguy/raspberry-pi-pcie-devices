---
layout: default
title: Boards
---
## Compute Module 4 Boards and Projects
{: .no_toc}

If you think a project should be added here, please [open an issue on GitHub](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues) to add it.

### Categories
{: .no_toc}

- TOC
{:toc}

### Production Boards

The following boards are commercially available and can be purchased today.

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Board</th>
    </tr>
  </thead>
  <tbody>
{% for board in site.boards_cm %}
  {% if board.status == "production" %}
    <tr>
      <td>
        {% if board.picture %}
          <a href="{{ board.url }}"><img class="board_table_picture" src="{{ board.picture | image_thumbnail }}" alt="{{ board.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ board.url }}">{{ board.title }}</a><br>
        (<a href="{{ board.link }}">Website</a>)
      </td>
    </tr>
  {% endif %}
{% endfor %}
  </tbody>
</table>

### Prototype or Non-Commercial Boards

The following boards are either not yet commercially available or one-offs and _might_ be licensed under an Open Hardware License, allowing you to build your own.

<table class="card_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>Board</th>
    </tr>
  </thead>
  <tbody>
{% for board in site.boards_cm %}
  {% if board.status == "prototype" %}
    <tr>
      <td>
        {% if board.picture %}
          <a href="{{ board.url }}"><img class="board_table_picture" src="{{ board.picture | image_thumbnail }}" alt="{{ board.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ board.url }}">{{ board.title }}</a><br>
        (<a href="{{ board.link }}">Website</a>)
      </td>
    </tr>
  {% endif %}
{% endfor %}
  </tbody>
</table>

## About
{: .no_toc}

This project is maintained by [Jeff Geerling](https://www.jeffgeerling.com). The Raspberry Pi Compute Module 4 is a product of [Raspberry Pi (Trading) Limited](https://www.raspberrypi.org/about/).
