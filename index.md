---
layout: home
---
Writing samples: 

* Simple: [Using Instant Messaging]({{ site.baseurl }}/im/index.html)
* Technical: [Jekyll Setup]({{ site.baseurl }}/jekyll/index.html)

Techie notes to self:

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
