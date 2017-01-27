---
layout: page
title: ps
permalink: /ps/
resource: true
---
```
% ps
   PID TT       S  TIME COMMAND
 11024 pts/3    S  0:00 -tcsh
 11049 pts/3    S  0:16 emacs
 11052 pts/3    S  0:00 /tools/bin/perl /tools/bin/netscape
 11053 pts/3    S  3:17 /tools/pkgs/netscape/default/netscape -irix-session-management
 11054 pts/3    S  0:00 (dns helper)
 11534 pts/3    T  0:00 pine
```

```
% ps -e | grep netscape
 11052 pts/3    S  0:00 /tools/bin/perl /tools/bin/netscape HOME=/home/gmcmilla
 11053 pts/3    S  3:20 /tools/pkgs/netscape/default/netscape -irix-session-man
 25625 pts/3    S  0:00 grep netscape HOME=/home/gmcmillan PATH=/tools/pkgs/fra
[gmcmillan@suncs9 ~]% kill -9 11052
[gmcmillan@suncs9 ~]% ps -e | grep netscape
```

# Background Processes

If I forgot to put a process in the background by using "&", then
enter Ctrl-Z followed by "bg". If I don't background (&) a command,
then my shell will not be usable until my process stops. The shell
will remain waiting for the process to end. If I put the process in
the background, the shell does not wait.

```
greg-pc# emacs
^Z
Suspended
greg-pc# bg
[1]    emacs &
greg-pc#
```
