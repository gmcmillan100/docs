---
layout: page
title: Mail
permalink: /mail/
resource: true
---

```
[gmcmillan@suncs9 ~]% mail gmcmillan
Subject: Test Email
Hello,

Did you get this, Greg?
^C  					<<-----Enter Ctrl C here
(Interrupt -- one more to kill letter) 	<<-----Enter Ctrl D here
EOT 					<<-----Enter Return here
```

# mailstat

Look at the log file with mailstat.

If you do:

  mailstat -k ~/Procmail/log

(assuming that last part is a reference to your log file) mailstat
will show you a useful summary:

[gmcmillan@redd2212 ~]% mailstat -k ~/Procmail/log

  Total  Number Folder
  -----  ------ ------
7243721     576 /var/mail/gmcmillan
  38779      18 cvs-atlas
  35568       8 cvs-lynxos
 823012     332 cvs-sw
 578923     252 cvssw
 742279     113 gnats-submit
  20531       3 hardware
 129889      41 routing
 485685      86 software
5152070     124 sw
  -----  ------
15250457    1553

If you leave off the "-k" (for keep)
it will show the same summary, move your log to log.old, and start a
new log:

[gmcmillan@redd2212 ~]% mailstat ~/Procmail/log

  Total  Number Folder
  -----  ------ ------
7243721     576 /var/mail/gmcmillan
  38779      18 cvs-atlas
  35568       8 cvs-lynxos
 823012     332 cvs-sw
 578923     252 cvssw
 742279     113 gnats-submit
  20531       3 hardware
 129889      41 routing
mailstat: unmodified: line 1


# mailq

Mailq prints a summary of the mail messages queued for future delivery.
Run the command on the mail host (i.e., miata):

[gmcmillan@suncs9 ~]% telnet miata
Trying 10.1.1.1...
Connected to miata.procket.com.
Escape character is '^]'.


SunOS 5.8

login: gmcmillan
Password: 
Last login: Tue Dec 11 11:47:28 from suncs9.procket.c
OS Release is Solaris 8 6/00 s28s_u1wos_08 SPARC
System is a Sun Enterprise 420R (2 X UltraSPARC-II 450MHz) 1024 MB RAM
Sun Microsystems Inc.   SunOS 5.8       Generic February 2000

No mail arrived since Dec 11 11:20
[gmcmillan@miata ~]% mailq
fB7ME6es010998     3472 Fri Dec  7 14:14 <ncvporting-admin@Procket.com>
                 (Deferred: Connection timed out with proket.com.)
                                         <mhoque@proket.com>
fB7KPVes009593     2580 Fri Dec  7 12:25 <ncvporting-admin@Procket.com>
                 (Deferred: Connection timed out with proket.com.)

