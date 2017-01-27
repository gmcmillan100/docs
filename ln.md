---
layout: page
title: ln
permalink: /ln/
resource: true
---
Create a sim link.

The other choice is to create a file named that. All the data will go
to that file, and I'll have to delete its contents once per
week. There are two ways to verify that a symlink was created: use "ls
-l" or "ls -F". The @ symbol means sim link.

To make the rrcs mail go away instead of to a file do:

      ln -s /dev/null ~/Mail/spools/in-rrcs


[gmcmillan@redd2212 spools]% ls -l
total 0
lrwxrwxrwx    1 gmcmilla gmcmilla        9 Jan 10 14:51 in-rrcs -> /dev/null
[gmcmillan@redd2212 spools]% ls -F
in-rrcs@
[gmcmillan@redd2212 spools]% ls-F
in-rrcs@ 


/dev/null is the place that is nowhere. When you write something to
dev/null, it disappears. When you read from dev/null, you don't get
anything. It's the "I don't care place." Sometimes you want to use a
command that creates a lot of output, but you only want to see if the
command works. Therefore, you route the output of the command to
dev/null.
