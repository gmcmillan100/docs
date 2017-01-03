# Sublime Markdown Preview

Install Markdown Preview and Package Control:

https://packagecontrol.io/packages/Markdown%20Preview

Add this Sublime keymap shortcut under Preferences > Key Bindings - User:

~~~~
[
	{ "keys": ["command+p"], "command": "markdown_preview", "args": {"target": "browser", "parser":"markdown"} }
]
~~~~