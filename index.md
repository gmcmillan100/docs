---
layout: home
---
I coded this site using Jekyll, Markdown, and Git.

Writing samples: 

* Technical: [Jekyll]({{ site.baseurl }}/jekyll/index.html)
* Simple: [Using Instant Messaging]({{ site.baseurl }}/im/index.html)

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

<div>
	<script>
  (function() {
    var cx = '006793602710358171439:8vsbxk9foow';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search></gcse:search>
</div>