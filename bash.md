---
layout: page
title: Bash
permalink: /bash/
resource: true
---

It's the GNU Bourne-Again SHell (BASH).

```
Ctrl a		Jump to beginning of line
Ctrl e		Jump to end of line
Ctrl k		Yank a line
Ctrl y		Put the yank back
```

For a great host prompt, issue "vi .bash_profile" then enter:

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

Which version is installed:

```
$ bash --version
GNU bash, version 2.05b.0(1)-release (i386-portbld-freebsd4.7)
Copyright (C) 2002 Free Software Foundation, Inc.
```

# Switch to bash

Discover what shells are available on local mac:

```
cat /etc/shells
/bin/bash
/bin/csh
/bin/dash
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
```

Change to bash:

```
chsh -s /bin/bash
```

open a new terminal to trigger a new shell login:

Print active shell:

```
$ echo $SHELL
/bin/bash
```

# Install

```
# pkg install bash
```

# Resources

https://tiswww.case.edu/php/chet/bash/bashtop.html
