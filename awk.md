---
layout: page
title: awk
permalink: /awk/
resource: true
---

# Remove the text from a line after a certain character


```
mint list-products | grep js-library | awk -F 'with tags' '{print $1}' > js-library
```

https://unix.stackexchange.com/questions/117384/how-can-i-remove-the-text-from-a-line-after-a-certain-character-with-awk