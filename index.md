---
layout: home
---
<div id="grid">
	<ul id = "limheight">
	{% for page in site.pages %}
	  {% if page.resource == true %}
	    <div class="item">
	      <li><a href="{{ site.baseurl }}{{ page.url }}">{{ page.title }}</a></li>
	    </div>
	  {% endif %}
	{% endfor %}
	</ul>
</div>
