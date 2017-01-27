---
layout: page
title: Procmail
permalink: /procmail/
resource: true
---

Use a proc mail filter to filter email. This filtering gets done
before emacs or VM gets the mail. Jerry uses a simple filter for the rrcs
stuff. It's in his /procmail dir. Ask jerry for the url web page that
describes how to set this up. 


I still have to poll the IMAP server to get my email. 

rrcs messages. Send them to a dev/null.

1. Procmail Overview

http://www.ii.com/internet/robots/procmail/qs/
http://www.cs.hmc.edu/%7Esmikes/emacs/vm-procmail.html

Procmail is the mail-delivery agent for VM. When I get mail, procmail
arrives. By default, procmail looks in my home dir for the .procmailrc
file. If it's corrupted, my mail might get hosed. To test, send myself
some mail and verify that I received it.

In the world of email, there are two big classes of programs: 

  o Mail Transfer Agents (MTAs), such as Procmail

  o Mail User Agents (MUAs), such as VM

Telling your MUA to fetch from a POP or IMAP server doesn't
transform it into an MTA any more than telling it to fetch from a
local spool does.

Alternatively, I can use VM for to poll the IMAP server
periodically. No need to use Procmail unlesss I need to filter an
email poop-blizzard. 

Just put this in .vm:

(setq vm-spool-files
      (list (concat "imap:email:143:inbox:login:"
		    (getenv "USER") ":*")
	    ;; This one shouldn't be necessary, but until I see that
	    ;; it's impossible for anything to get into the
	    ;; old-fashioned spool I'll keep it.
	    (concat "/var/spool/mail/" (getenv "USER"))))

;; Deciding how frequently emacs should hang waiting for our flaky IMAP
;; server is a tough call.
(setq vm-mail-check-interval 180)


Procmail Filters
================

0. Verify that the /Procmail and /Mail/spools directories are set up:

      mkdir ~/Procmail
      mkdir -p ~/Mail/spools

1. From VM, create a mailbox by using the "s" command.


2. To filter incoming emails into mailboxes, create a symbolic link
   between the ~Mail/spools file and the destination mailbox. This sym link
   enables VM to pick up the mail from the spool file. 

      ln -s /home/gmcmillan/Mail/mgurus ~/Mail/spools/mgurus

   Alternatively, to make the rrcs noise go away instead of to a file do:

      ln -s /dev/null ~/Mail/spools/in-rrcs

/dev/null is the place that is nowhere. When you write something to
dev/null, it disappears. When you read from dev/null, you don't get
anything. It's the "I don't care place." Sometimes you want to use a
command that creates a lot of output, but you only want to see if the
command works. Therefore, you route the output of the command to
dev/null.

There are two ways to verify that a symlink was created: use "ls -l"
or "ls -F". The @ symbol means symlink.

[gmcmillan@redd2212 spools]% ls -l
total 0
lrwxrwxrwx    1 gmcmilla gmcmilla        9 Jan 10 14:51 in-rrcs -> /dev/null
[gmcmillan@redd2212 spools]% ls -F
in-rrcs@
[gmcmillan@redd2212 spools]% ls-F
in-rrcs@ 



3. Verify that the symlink is installed. See "->":

[gmcmillan@suncs9 ~]% ll Mail/spools
total 0
lrwxrwxrwx   1 gmcmilla gmcmilla        9 Feb  7  2001 atlasroot -> /dev/null
lrwxrwxrwx   1 gmcmilla gmcmilla       36 Sep 13 11:07 customer-visits -> /home/gmcmillan/Mail/customer-visits



4. In the Procmail directory, create a recipe file named
   <mailbox>.rc. A recipe is a set of conditions and an action to be
   performed if the conditions are satisfied. 

   The following line is the template for what to do
   with the rrcs mail. It means "when you see a TO line that says
   "rrcs-chips", then send it to this folder. The * and * are regular
   expressions that mean "I don't care what the message begins or ends with."

:0
*^TO<SourceEmail>*
<DestinationMailbox>

Example:

:0
*^TOrrcs-chips*
in-rrcs


Whenever I'm putting instructions into a file, it's best practice to
put a carriage return at the end of the last statement (line):


Example:

 :0
 *^TO_rrcs-chips*
 in-rrcs <------------------CR here


5. Create a file named .procmailrc in your home directory and set up
   the appropriate directives. Notice the INCLUDEERC= line and the .rc file. 

   Edit the .procmailrc file last. Consider creating it under a
   differnt name first; then, when I'm satisfied with its integrity,
   mv the file into .procmailrc. Reason: While .procmailrc exists, if
   it has errors in it, not good.


# Set to yes when debugging
VERBOSE=no

# Remove ## when debugging; set to no if you want minimal logging
## LOGABSTRACT=all

# Replace $HOME/Msgs with your message directory
MAILDIR=$HOME/Mail/spools       # Make sure this directory exists!

# Directory for storing procmail-related files
PMDIR=$HOME/Procmail

LOGFILE=$PMDIR/log
##INCLUDERC=$PMDIR/testing.rc
##INCLUDERC=$PMDIR/lists.rc
INCLUDERC=$PMDIR/rrcs.rc


Note: It's quicker and simpler to have little files. However, I don't
have to do it this way.


Inspecting and Deleting my Log File
===================================
Look at the log file with mailstat.  If you do:

  mailstat -k ~/Procmail/log

(assuming that last part is a reference to your log file) mailstat
will show you a useful summary.  If you leave off the "-k" (for keep)
it will show the same summary, move your log to log.old, and start a
new log.  I usually do the -k thing for a week or so until the numbers
get big, then the other way to clobber the log.  I also shit-can any
real files that get big.  But if you use /dev/null, you're set with
that.

In the following example, the "Couldn't read" error is not
normal. Given that it's counted such a small fraction of your rrcs
traffic, chances are it was something wrong at the time you started
filtering.  Look at the log and see if all the errors are near the
beginning.  If so, start a new log and gorget about it.Otherwise, look
to see if the errors mean anything to you. Note: The difference
between "Total" and "Number" is the former is a byte count, and the
latter is a message count.



Mailstat Examples:
 
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
 485685      86 software
5152070     124 sw
  -----  ------
15250457    1553
[gmcmillan@redd2212 ~]% mailstat ~/Procmail/log
No mail arrived since May 9 13:16
[gmcmillan@redd2212 ~]% 
[gmcmillan@redd2212 ~]% 
[gmcmillan@redd2212 ~]% ls -l ~/Procmail
total 1624
-rw-r--r--    1 gmcmilla gmcmilla       29 Feb  7 15:31 atlasroot.rc
-rw-r--r--    1 gmcmilla gmcmilla       28 Feb  8 09:38 cvs-atlas.rc
-rw-r--r--    1 gmcmilla gmcmilla       31 Apr 23 14:07 cvslynxos.rc
-rw-r--r--    1 gmcmilla gmcmilla       22 Apr 30 15:51 cvssw.rc
-rw-r--r--    1 gmcmilla gmcmilla       23 Feb  6 14:01 cvssw.rc~
-rw-r--r--    1 gmcmilla gmcmilla       35 Feb  8 09:42 gnats-submit.rc
-rw-r--r--    1 gmcmilla gmcmilla       27 Feb 10 09:55 hardware.rc
-rw-------    1 gmcmilla gmcmilla        0 May  9 13:19 log
-rw-------    1 gmcmilla gmcmilla   216246 May  9 13:16 log.old
-rw-------    1 gmcmilla gmcmilla  1437194 Feb  6 13:58 log~
-rw-r--r--    1 gmcmilla gmcmilla       31 Feb  7 15:30 memlibroot.rc
-rw-r--r--    1 gmcmilla gmcmilla       28 May  4 12:52 routing.rc
-rw-r--r--    1 gmcmilla gmcmilla       42 May  4 11:31 routing.rc~
-rw-r--r--    1 gmcmilla gmcmilla       31 Jan 10 15:03 rrcs.rc
-rw-r--r--    1 gmcmilla gmcmilla       29 Feb  7 08:53 sllibroot.rc
-rw-r--r--    1 gmcmilla gmcmilla       27 Feb  8 09:43 software.rc
-rw-r--r--    1 gmcmilla gmcmilla       15 May  4 12:53 sw.rc
-rw-r--r--    1 gmcmilla gmcmilla       24 May  4 11:30 sw.rc~
-rw-r--r--    1 gmcmilla gmcmilla       29 Feb 10 09:55 toolsroot.rc
[gmcmillan@redd2212 ~]% 



16. References

	http://www.procmail.org/

	http://pm-doc.sourceforge.net/

	http://www.ii.com/internet/robots/procmail/qs/

CVS:

	http://www.cvshome.org/docs/manual/cvs.html

