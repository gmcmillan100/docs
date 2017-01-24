# Intro

Jekyll is, at its core, a text transformation engine. The concept behind the system is this: you give it text written in your favorite markup language, be that Markdown, Textile, or just plain HTML, and it churns that through a layout or a series of layout files. 

See https://jekyllrb.com/docs/structure/

Jekyll and GitHub Pages, http://jmcglone.com/guides/github-pages/

# Basic Setup

1. Create `.gitignore` and ignore the `_site` directory that Jekyll automatically generates each time you commit:

	```
	vi .gitignore
	```

and put this in it:

	```
	_site
	```

2. Create a _config.yml file that tells Jekyll some basics about your project. In this example, we're telling Jekyll the name of our site and what version of Markdown we'd like to use:

	```
	vi _config.yml
	```

and put this in it:

	```
	name: Greg McMillan
	markdown: kramdown
	```

3. Make index.html and main layout that will contain repeated elements like our <head> and <footer>:

$ touch index.html
$ mkdir _layouts
$ cd _layouts
$ touch default.html


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

3. Inspect Jekyll's gems:

		```
		$ gem list jekyll

		*** LOCAL GEMS ***

		jekyll (3.3.1)
		jekyll-sass-converter (1.5.0)
		jekyll-watch (1.5.0)
		```
# Hello World

Running `jekyll new` will bundle install, resolve default dependencies, and create default config files:

```
jekyll new mynewsite
cd mynewsite
```

```
Gemfile		
Gemfile.lock	
_config.yml	
_posts		
about.md	
index.md
```

Look at the configs:

```
cat Gemfile
cat _config.yml
```

Build, serve, then visit the local URL at http://127.0.0.1:4000/:

```
jekyll build
jekyll serve
```

# Install Theme

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

# Resources

Jekyll docs, https://jekyllrb.com/docs/themes/

tjohnson's video:

http://idratherbewriting.com/2017/01/18/writing-tech-docs-like-a-hacker-with-jekyll/


# Source

https://github.com/jekyll/jekyll

http://idratherbewriting.com/documentation-theme-jekyll/

http://jekyllbootstrap.com/lessons/jekyll-introduction.html
