---
layout: default
title: HATs
---
## Raspberry Pi 5 HATs
{: .no_toc}

If you think a project should be added here, please [open an issue on GitHub](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues) to add it.

### Categories
{: .no_toc}

- TOC
{:toc}

### Production HATs

The following HATs are commercially available and can be purchased today.

<table class="hat_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>HAT</th>
    </tr>
  </thead>
  <tbody>
{% for hat in site.hats %}
  {% if hat.status == "production" %}
    <tr>
      <td class="hat_picture_td">
        {% if hat.picture %}
          <a href="{{ hat.url }}"><img class="hat_table_picture" src="{{ hat.picture | image_thumbnail }}" alt="{{ hat.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ hat.url }}"><strong>{{ hat.title }}</strong></a><br>
        {{ hat.short_description }}
        <div class="links">
          <a href="{{ hat.url }}">More Info</a> | <a href="{{ hat.link }}">Website</a>
        </div>
      </td>
    </tr>
  {% endif %}
{% endfor %}
  </tbody>
</table>

### Prototype or Non-Commercial HATs

The following HATs are either not yet commercially available or one-offs and _might_ be licensed under an Open Hardware License, allowing you to build your own.

<table class="hat_table">
  <thead>
    <tr>
      <th>Picture</th>
      <th>HAT</th>
    </tr>
  </thead>
  <tbody>
{% for hat in site.hats %}
  {% if hat.status == "prototype" %}
    <tr>
      <td class="hat_picture_td">
        {% if hat.picture %}
          <a href="{{ hat.url }}"><img class="hat_table_picture" src="{{ hat.picture | image_thumbnail }}" alt="{{ hat.title }}"></a>
        {% endif %}
      </td>
      <td>
        <a href="{{ hat.url }}"><strong>{{ hat.title }}</strong></a><br>
        {{ hat.short_description }}<br>
        <div class="links">
          <a href="{{ hat.url }}">More Info</a> | <a href="{{ hat.link }}">Website</a>
        </div>
      </td>
    </tr>
  {% endif %}
{% endfor %}
  </tbody>
</table>

## About
{: .no_toc}

This project is maintained by [Jeff Geerling](https://www.jeffgeerling.com). The Raspberry Pi Compute Module 4 is a product of [Raspberry Pi (Trading) Limited](https://www.raspberrypi.org/about/).
