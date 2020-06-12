---
layout: page
title: Markdown
permalink: /markdown/
resource: true
---

# Basic syntax

See [Basic Syntax](https://www.markdownguide.org/basic-syntax/)

[Kramdown](https://kramdown.gettalong.org/)

# Sublime Indenting and Comments

To shift a block of text to the right/left in Sublime Text, `cmd + ]/[` in OSX.

* **Comments**: Done with a # hash character. Use the **command** **/** toggle to comment in/out lines in Sublime and VScode.

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

# Inline Images

``
![](../images/bios-pin.jpg)
``

# TOC Anchors in Markdown

## Creating

To create an anchor to a heading in github flavored markdown. Add - and lowercase characters between each word in the heading and wrap the value in parens (#some-markdown-heading). 

So a link like this:

```
[Critical System and Applications](#critical-system-and-applications)
```

Will jump to a heading like this:

```
# Critical System and Applications
```

Alternatively, use a named html anchor tag like this:

[mytext-*/](#there_you_go)

<a name="there_you_go"></a>

## Periods in anchors

The link breaks. Solution is to remove the period altogether.

```
[Using Rest.li JARs](#using-restli-jars)

## Using Rest.li JARs
```
## Jekyll frontend conversion

For Markdown-to-Jekyll frontend conversion to work for headings on Github Pages (https://gmcmillan100.github.io/docs/freebsd.html), the following must be true:

* The line immediately before the heading hash (#) must be blank
* No blank space after the #

# Resources

https://guides.github.com/features/mastering-markdown/