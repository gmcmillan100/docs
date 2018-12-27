---
layout: page
title: wget
permalink: /wget/
resource: true
---

Use wget to create an offline copy of a site that you can take and view even without internet access. 

	```
	wget --mirror --convert-links --adjust-extension --page-requisites 
	--no-parent http://example.org
	```

Explanation of the various flags:

	```
	--mirror – Makes (among other things) the download recursive.
	--convert-links – convert all the links (also to stuff like CSS stylesheets) to relative, so it will be suitable for offline viewing.
	--adjust-extension – Adds suitable extensions to filenames (html or css) depending on their content-type.
	--page-requisites – Download things like CSS style-sheets and images required to properly display the page offline.
	--no-parent – When recursing do not ascend to the parent directory. It useful for restricting the download to only a portion of the site.
	```

Alternatively, the command above may be shortened:

wget -mkEpnp http://example.org
Note: that the last p is part of np (--no-parent) and hence you see p twice in the flags.

# Install

	```
	$ brew install wget
	```

# Example

	```
	$ wget -mkEpnp http://www.xscribe.net/
	```

# Auth Example

1. Go to the site
2. Create a cookies.txt file using https://chrome.google.com/webstore/detail/cookiestxt/njabckikapfpffapmjgojcnbfjonfjfg/related?hl=en
3. Run the wget with username / pass:

	```
	wget --user=dmcmillan100@gmail.com --password='100bimini' -x --load-cookies cookies.txt "https://learn.codingdojo.com/dashboard"
	```

# Resources

Homebrew install, https://www.hacksparrow.com/how-to-install-wget-on-your-mac.html

auth login, https://www.cyberciti.biz/faq/wget-command-with-username-password/

wget --user dmcmillan100@gmail.com --password 100bimini https://learn.codingdojo.com/signin

wget --user dmcmillan100@gmail.com --password 100bimini -x --load-cookies cookies.txt "https://learn.codingdojo.com/dashboard"

wget --user=dmcmillan100@gmail.com --password='100bimini' -x --load-cookies cookies.txt "https://learn.codingdojo.com/dashboard"