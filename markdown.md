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

# Anchors in Markdown

To create an anchor to a heading in github flavored markdown. Add - and lowercase characters between each word in the heading and wrap the value in parens (#some-markdown-heading). 

So a link like this:

```
[Critical System and Applications](#critical-system-and-applications)
```

Will jump to a heading like this:

```
# Critical System and Applications
```

# Resources

https://guides.github.com/features/mastering-markdown/