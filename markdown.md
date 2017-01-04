# Sublime Markdown Preview

Github Flavored Markdown (GFM)

Install Markdown Preview and Package Control:

https://packagecontrol.io/packages/Markdown%20Preview

Add this Sublime keymap shortcut under Preferences > Key Bindings - User:

~~~~
[
	{ "keys": ["command+p"], "command": "markdown_preview", "args": {"target": "browser", "parser":"markdown"} }
]
~~~~

# TOC Anchors in Markdown

To create an anchor to a heading in github flavored markdown. Add - and lowercase characters between each word in the heading and wrap the value in parens (#some-markdown-heading). 

So a link like this:

```
[Critical System and Applications](#critical-system-and-applications)
```

Will jump to a heading like this:

```
# Critical System and Applications
```

Tip. For heading Markdown-to-Jekyll frontend conversion to work on Github Pages (https://gmcmillan100.github.io/docs/freebsd.html), there must be a blank space immediately before the Heading (#).

# Resources

https://guides.github.com/features/mastering-markdown/