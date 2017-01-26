---
layout: home
---
<div class="blurb">
	<p></p>
</div>

<ul>
{% for page in site.pages %}
  {% if page.resource == true %}
    <div class="item">
      <li><a href="{{ page.url }}">{{ page.title }}</a></li>
    </div>
  {% endif %}
{% endfor %}
</ul>