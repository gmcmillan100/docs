---
layout: page
title: Bash
permalink: /bash/
resource: true
---

# The GNU Bourne-Again SHell (BASH)

```
Ctrl a		Jump to beginning of line
Ctrl e		Jump to end of line
Ctrl k		Yank a line
Ctrl y		Put the yank back
```

A great host prompt. Do "vi .bash_profile" then put this in it:

```
PS1='\u@\h \w> $ '
```

What shell am I using:

```
$ echo $SHELL
/usr/local/bin/bash
```

What PATH is the shell using:

```
$ echo $PATH
/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/X11R6/bin:/home/greg/bin
```

Which version:

```
$ bash --version
GNU bash, version 2.05b.0(1)-release (i386-portbld-freebsd4.7)
Copyright (C) 2002 Free Software Foundation, Inc.
```

# Install

```
# pkg install bash
```

# Resources

https://tiswww.case.edu/php/chet/bash/bashtop.html
