---
layout: default
title: Boards
---
## Compute Module Boards and Projects
{: .no_toc}

If you think a project should be added here, please [open an issue on GitHub](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues) to add it.

### Categories
{: .no_toc}

- TOC
{:toc}

### Production Boards

The following boards are commercially available and can be purchased today.

<table class="board_table">
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
      <td class="board_picture_td">
        {% if board.picture %}
          <a href="{{ board.url }}"><img class="board_table_picture" src="{{ board.picture | image_thumbnail }}" alt="{{ board.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ board.url }}"><strong>{{ board.title }}</strong></a><br>
        {{ board.short_description }}
        <div class="links">
          <a href="{{ board.url }}">More Info</a> | <a href="{{ board.link }}">Website</a>
        </div>
      </td>
    </tr>
  {% endif %}
{% endfor %}
  </tbody>
</table>

### Prototype or Non-Commercial Boards

The following boards are either not yet commercially available or one-offs and _might_ be licensed under an Open Hardware License, allowing you to build your own.

<table class="board_table">
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
      <td class="board_picture_td">
        {% if board.picture %}
          <a href="{{ board.url }}"><img class="board_table_picture" src="{{ board.picture | image_thumbnail }}" alt="{{ board.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ board.url }}"><strong>{{ board.title }}</strong></a><br>
        {{ board.short_description }}<br>
        <div class="links">
          <a href="{{ board.url }}">More Info</a> | <a href="{{ board.link }}">Website</a>
        </div>
      </td>
    </tr>
  {% endif %}
{% endfor %}
  </tbody>
</table>

## About
{: .no_toc}

This project is maintained by [Jeff Geerling](https://www.jeffgeerling.com). Raspberry Pi is a product of [Raspberry Pi Ltd](https://www.raspberrypi.com/about/).
