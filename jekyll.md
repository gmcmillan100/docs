---
layout: page
title: Jekyll
permalink: /jekyll/
resource: true
categories: [gold]
description: A 400 oz bar
---

* [Introduction](#introduction)
* [Installation](#installation)
* [Basic Setup](#basic-setup)
* [Baseurl](#baseurl)
* [Linking](#linking)
* [Site](#site)
* [Search](#search)
* [CSS](#css)
* [Theme Install](#theme-install)
* [Build and Serve](#build-and-serve)
* [Liquid Contains Property](#liquid-contains-property)
* [Search](#search)
* [Resources](#resources)

# Introduction

Jekyll is a static site generator and text transformation engine. Give Jekyll text written in your favorite markup language, such as Markdown, and Jekyll will churn that through a layout or a series of layout files. 

# Installation

It's a pain to install. There are too many dependencies and have to work with the new mac version.

Main article: https://jekyllrb.com/docs/installation/

1. Install Jekyll:

	```
	$ gem install jekyll
	```

2. Verify Jekyll's installation location and version:

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

# Basic Setup

Do this after installation.

1: Run `jekyll new <name>` to create a new site, bundle install, resolve default dependencies, and create default config files:

```
jekyll new mynewsite
cd mynewsite
```

These files are autogen'd at the root of the source directory:

```
_config.yml	
Gemfile		
Gemfile.lock
_posts		
about.md	
index.md
```

Jekyll's configuration file is `_config.yml`. Bundler uses `Gemfile` and `Gemfile.lock` to keep track of required gems.

2: Open the `_config.yml` configuration file:

```
vi _config.yml
```

then add some basic information:

```
title: Kringle KB
name: Greg McMillan
email: gmcmillan100@gmail.com
```

3: Build the site on the local preview server then visit http://127.0.0.1:4000/ when prompted:

```
jekyll serve
```

When `jekyll serve` runs, it automatically creates a `_site` directory at the project's root. That’s where files are saved when they’re turned into static HTML. Don’t touch the files in here — they’re the generated files and will get overwritten every time changes are made.

4: Create `.gitignore` and ignore the `_site` directory that Jekyll automatically generates each time you commit:

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

There are several ways to create links.

Each .md has a permalink in the header like this:

```
---
layout: page
title: Flask
permalink: /flask/
resource: true
---
```

That permalink can be linked to from within a .md like this:

```
[Flask](/docs/flask/) provides the web ...
```

In the example, the `/docs/` prefix is defined in `_config.yml` as `baseurl: "/docs"`.

Link to a # subsection. Notice there's no forward slash (/) before the #:

```
[Dependency Injection](/rest.li/user_guide/restli_server#dependency-injection)
```

```
[Using Instant Messaging]({{ site.baseurl }}/im/index.html)
```

Can link to an html file:

```
[See Markdown](/markdown/index.html)
```

See https://jekyllrb.com/docs/templates/#link

# Site

When `jekyll serve` runs, it automatically creates a `_site` directory at the project's root. These are build files. Never check them into Git. 

If they are in your `git status`, you can remove them using `git checkout <file>` like this:

```
	$ git status
	...
		modified:   _site/404.html
		modified:   _site/Asynchronous-Servers-and-Clients-in-Rest_li.html
		modified:   _site/Attachment-Streaming.html
		modified:   _site/Building-Rest_li-from-Source.html
	...
	$ git checkout _site/*
	  error: pathspec '_site/How_To_Rest_li_Avro_conversions.html' did not match any file(s) known to git.
	$ rm _site/How_To_Rest_li_Avro_conversions.html
	$ git checkout _site/*
	$ git status
	...

		modified:   _config.yml
		deleted:    _site/How_To:Rest_li_Avro_conversions.html
		modified:   building.md
		modified:   d2_quick_start.md
		modified:   gradle.md

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

See also `/assets/main.scss` for more styles. 

## Materialize Numbered Lists Not Showing

vi _sass/materialize/components/_normalize.scss

Then, change the list-style-type from lower-alpha to decimal:

```
.markdown-body ol {
  padding-left: 0;
  margin-top: 0;
  margin-bottom: 0;
  list-style-type: decimal !important;
}
```

See http://jekyllmaterialize.panoramedia.it/ and https://github.com/macrod68/jekyll-materialize-starter-template

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

Do this in your template to get all the pages in the `gold` category:


```
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

# Search

## Lunr-js

See how Maxime implemented it at https://github.com/linkedin/rest.li/pull/118/commits/a1de40702ba76ba459ffec12afda94f09569395a

https://lunrjs.com/

Mnorth. It's a good option for smallish sites. 

Example setups:


* https://katydecorah.com/code/lunr-and-jekyll/ and https://katydecorah.com/search/
* https://arcath.net/2016/02/setting-up-lunr-js-in-jekyll
* https://rayhightower.com/blog/2016/01/04/how-to-make-lunrjs-jekyll-work-together/
* https://learn.cloudcannon.com/jekyll/jekyll-search-using-lunr-js/


Advice from Jose Gandullia (https://www.linkedin.com/in/josegandullia/)

Avoid. lunr-js hits performance issues after indexing 70ish files, don't use it, https://github.com/slashdotdash/jekyll-lunr-js-search

* Having "the client browser handle all the search" (e.g., lunr-js) sounds like a bad idea unless it's a really small site.

* I'd probably modify the search to index the site offline whenever it changes, have a server-side API for the search (that searches the index), and have the client call that API.

* On the other hand, Google has the potential to give you a smarter search than just a straight text search.

* Looks like Duck Duck go also has a searchbox you can add, of course then you have no control over the actual search.

https://duckduckgo.com/search_box

My CSE, https://cse.google.com/cse/all

Options by tjohnson:

* https://github.com/slashdotdash/jekyll-lunr-js-search
* Algolia, https://community.algolia.com/docsearch/ and https://www.algolia.com/
* CSE, https://cse.google.com/cse/
* Swiftype, https://swiftype.com/


# Google Analytics

Add this to _includes/head.html in your Jekyll doc project:

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-128576866-1"></script>

where "UA-128576866" is your account ID.

Full example:

https://github.com/linkedin/rest.li/blob/gh-pages-source/src/_includes/head.html

https://analytics.google.com/analytics/web/?authuser=1#/report/content-engagement-flow/a128576866w187663829p184404553/_u.date00=20181111&_u.date01=20181117/

```
<head>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-128576866-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-128576866-1');
    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>

    <title>{% if page.title %}{{ page.title | escape }}{% else %}{{ site.title | escape }}{% endif %}</title>
    <meta name="description" content="{{ page.excerpt | default: site.description | strip_html | normalize_whitespace | truncate: 160 | escape }}" />

    <link rel="icon"
      type="image/png"
      href="/rest.li/images/icon_pegasus.png">
  
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen,projection" href="{{ "/assets/materialize.css" | relative_url }}" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="{{ "/assets/main.css" | relative_url }}">
    <link rel="canonical" href="{{ page.url | replace:'index.html','' | absolute_url }}" />
    <link rel="alternate" type="application/rss+xml" title="{{ site.title | escape }}" href="{{ "/feed.xml" | relative_url }}" />

    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  
    {% if jekyll.environment == 'production' and site.google_analytics %}
    {% include google-analytics.html %}
    {% endif %}
    <script>
       $(function() {
          $("h1").addClass("no_toc");
       });
    </script>
</head>
```

# Resources

See https://jekyllrb.com/docs/structure/

Jekyll and GitHub Pages:

https://24ways.org/2013/get-started-with-github-pages/
http://jmcglone.com/guides/github-pages/

Jekyll docs, https://jekyllrb.com/docs/

https://24ways.org/2013/get-started-with-github-pages/

tjohnson's video:

http://idratherbewriting.com/2017/01/18/writing-tech-docs-like-a-hacker-with-jekyll/

jekyll cheat sheet, http://ricostacruz.com/cheatsheets/jekyll.html

https://github.com/jekyll/jekyll

http://idratherbewriting.com/documentation-theme-jekyll/

http://jekyllbootstrap.com/lessons/jekyll-introduction.html
