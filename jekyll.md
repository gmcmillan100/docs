---
layout: page
title: Jekyll
permalink: /jekyll/
resource: true
categories: [gold]
description: A 400 oz bar
---

* [Introduction](#introduction)
* [Basic Setup](#basic-setup)
* [Baseurl](#baseurl)
* [Linking](#linking)
* [Installation](#installation)
* [CSS](#css)
* [Theme Install](#theme-install)
* [Build and Serve](#build-and-serve)
* [Liquid Contains Property](#liquid-contains-property)
* [Resources](#resources)

# Introduction

Jekyll is a text transformation engine and static site generator. The concept behind the system is this: you give it text written in your favorite markup language, be that Markdown, Textile, or just plain HTML, and it churns that through a layout or a series of layout files. 

See https://jekyllrb.com/docs/structure/

[See Markdown](/markdown/index.html)

Jekyll and GitHub Pages:

https://24ways.org/2013/get-started-with-github-pages/
http://jmcglone.com/guides/github-pages/

# Basic Setup

Do this after installation.

1. Run `jekyll new <name>` to create a new site, bundle install, resolve default dependencies, and create default config files:

```
jekyll new mynewsite
cd mynewsite
```

These files were autogen'd at the root of the source directory:

```
_config.yml	
Gemfile		
Gemfile.lock
_posts		
about.md	
index.md
```

Jekyll's configuration file is `_config.yml`. Bundler uses `Gemfile` and `Gemfile.lock` to keep track of required gems.

2. Open the `_config.yml` configuration file:

	```
	vi _config.yml
	```

	then add some basic info:

	```
	title: Kringle KB
	name: Greg McMillan
	email: gmcmillan100@gmail.com
	```

3. Build the site on the local preview server then visit http://127.0.0.1:4000/ when prompted:

	```
	jekyll serve
	```

	When `jekyll serve` runs, it automatically creates a `_site` directory at the project's root. That’s where files are saved when they’re turned into static HTML. Don’t touch the files in here — they’re the generated files and will get overwritten every time changes are made.

4. Create `.gitignore` and ignore the `_site` directory that Jekyll automatically generates each time you commit:

	```
	vi .gitignore
	```

	and put this in it:

	```
	_site
	```

# Baseurl

In `_config.yml`, set baseurl to the subpath of your site:

``
baseurl: "/docs"
``

For example on github, the URL above resolves to this:

```
https://gmcmillan100.github.io/docs/
```
On an .md page, add the `site.baseurl` to the `page.url` to resolve:

```ruby
 <li><a href="{{ site.baseurl }}{{ page.url }}">{{ page.title }}</a></li>
```

# Linking

Links

```
[See Markdown](/markdown/index.html)
```

# Installation

Main article: https://jekyllrb.com/docs/installation/

1. Install it:

	```
	$ gem install jekyll
	```

2. Verify location and version:

	```
	$ which jekyll
	/Users/gmcmilla/.rvm/gems/ruby-2.0.0-p576/bin/jekyll
	$ jekyll --version
	jekyll 3.3.1
	```

3. Inspect Jekyll's locally installed gems:

	```
	$ gem list jekyll

	*** LOCAL GEMS ***

	jekyll (3.3.1)
	jekyll-feed (0.8.0)
	jekyll-sass-converter (1.5.0)
	jekyll-theme-cayman (0.0.3)
	jekyll-watch (1.5.0)
	```

# CSS

Main articles:

* https://jekyllrb.com/docs/assets/
* cat ~/.rvm/gems/ruby-2.0.0-p576/gems/minima-2.1.0/README.md

1. Recursively copy the `_sass` directory from the minima gem to the root level of the Jekyll project:

	```
	cd ~/.rvm/gems/ruby-2.0.0-p576/gems/minima-2.1.0
	cp -r _sass/ ~/docs/_sass
	```

2. Edit the approprite `.scss` file. In this example, the h1 font-size was changed in the `_layout.scss` file:

	```
	.post-content {
	  margin-bottom: $spacing-unit;

	  h1 {
	    font-size: 30px;

	    @include media-query($on-laptop) {
	      font-size: 28px;
	    }
	  }
	```

# Theme Install

Main article: https://jekyllrb.com/docs/themes/ and https://github.com/pietromenna/jekyll-cayman-theme

1. Find theme on remote server:

	```
	$ gem search jekyll-theme-cayman --remote

	*** REMOTE GEMS ***

	jekyll-theme-cayman (0.0.3)
	```

2. Install theme:

	```
	$ gem install jekyll-theme-cayman
	```

	Confirm installed:

	```
	$ bundle show jekyll-theme-cayman
	/Users/gmcmilla/.rvm/gems/ruby-2.0.0-p576/gems/jekyll-theme-cayman-0.0.3
	```

3. Edit config files:

	```
	vi Gemfile

	then enter this:

	gem "jekyll-theme-cayman"
	```

	```
	vi _config.yml

	then enter this:

	theme: jekyll-theme-cayman
	```

4. Bundle things up:

	```
	$ bundle install
	Resolving dependencies...
	...
	Using jekyll-theme-cayman 0.0.3
	...
	```

# Build and Serve

1. Build:

	```
	$ cd docs
	$ jekyll build
	Configuration file: none
	            Source: /Users/gmcmilla/trash/docs
	       Destination: /Users/gmcmilla/trash/docs/_site
	 Incremental build: disabled. Enable with --incremental
	      Generating... 
	                    done in 0.063 seconds.
	 Auto-regeneration: disabled. Use --watch to enable.
	```

2. Confirm files were exported to _site/:

	```
	$ ls -al _site
	```

3. Serve files locally:

	```
	$ jekyll serve
	Configuration file: none
	Configuration file: none
	            Source: /Users/gmcmilla/trash/docs
	       Destination: /Users/gmcmilla/trash/docs/_site
	 Incremental build: disabled. Enable with --incremental
	      Generating... 
	                    done in 0.034 seconds.
	 Auto-regeneration: enabled for '/Users/gmcmilla/trash/docs'
	Configuration file: none
	    Server address: http://127.0.0.1:4000/
	  Server running... press ctrl-c to stop.
	[2017-01-20 11:51:17] ERROR `/favicon.ico' not found.
	```

# Liquid Contains Property

Pages can be filtered and published based on their matched categories.

In `_config.yml`, add the index of categories:

```
category: [gold, silver, copper]
```
In your `page.md` inside the front matter, add one or more of the matching categories available in the `_config.yml`:

```
---
layout: page
title: Jekyll
categories: [gold]
description: A 400 oz bar
---
```

In your template to get all the pages in the `gold` category you do:


```ruby
<ul>
{% for page in site.pages %}
  {% if page.categories contains 'gold' %}
    <div class="item">
      <li><a href="{{ page.url }}">{{ page.title }}</a></li>
      <p>{{page.description}}</p>  
    </div>
  {% endif %}
{% endfor %}
</ul>
```


# Resources

Jekyll docs, https://jekyllrb.com/docs/

https://24ways.org/2013/get-started-with-github-pages/

tjohnson's video:

http://idratherbewriting.com/2017/01/18/writing-tech-docs-like-a-hacker-with-jekyll/

jekyll cheat sheet, http://ricostacruz.com/cheatsheets/jekyll.html

https://github.com/jekyll/jekyll

http://idratherbewriting.com/documentation-theme-jekyll/

http://jekyllbootstrap.com/lessons/jekyll-introduction.html
