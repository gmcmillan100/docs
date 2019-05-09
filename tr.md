---
layout: page
title: tr
permalink: /tr/
resource: true
---
Use `tr` to delete characters in a file.



##Example

To remove all blank spaces in a file:

cat f-april-19-clean | tr -d "[:blank:]" > test2

https://stackoverflow.com/questions/9953448/how-to-remove-all-white-spaces-from-a-given-text-file