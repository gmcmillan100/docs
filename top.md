---
layout: page
title: top
permalink: /top/
resource: true
---
```
% top
  7:06pm  up 14 days,  8:55,  2 users,  load average: 0.09, 0.09, 0.04
80 processes: 64 sleeping, 2 running, 0 zombie, 14 stopped
CPU states:  3.5% user,  4.3% system,  0.0% nice, 92.0% idle
Mem:   256648K av,  208872K used,   47776K free,   54188K shrd,   53376K buff
Swap:  393552K av,   15376K used,  378176K free                   70460K cached

  PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
 1686 root      11   0 54572  48M  1664 R     2.7 19.3 850:41 X
 1868 gmcmilla  10   0  3280 3008  2384 S     1.9  1.1 408:37 multiload_apple
 1788 gmcmilla   4   0  3400 3256  1012 S     1.1  1.2   6:37 sawfish
31692 gmcmilla   3   0  5952 5952  3412 S     0.9  2.3   0:10 gnome-terminal
 1153 gmcmilla  10   0  1224 1224   964 R     0.9  0.4   0:00 top
    1 root       0   0   116   68    48 S     0.0  0.0   0:07 init
    2 root       0   0     0    0     0 SW    0.0  0.0   0:01 kflushd
    3 root       0   0     0    0     0 SW    0.0  0.0   1:02 kupdate
    4 root       0   0     0    0     0 SW    0.0  0.0   0:00 kpiod
    5 root       0   0     0    0     0 SW    0.0  0.0   0:08 kswapd
    6 root     -20 -20     0    0     0 SW<   0.0  0.0   0:00 mdrecoveryd
   63 root       0   0     0    0     0 SW    0.0  0.0   0:00 khubd
```

Tips:

```
SHIFT+M		=	sort memory usage by application 
q		=	escape from memory-display mode 
free		=	display mem usage
```