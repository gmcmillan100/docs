
                         VM
                         ==

Table of Contents

M-x vm		Opens my email client application from Emacs
Fundamental mode


The ".vm" file. I can changes the settings in this file to alter my VM
controls and indicators.

From my laptop, logging into a host and starting emacs. It's best to
run emacs and VM on a remote host instead of my laptop:


1. VM Overview

VM is a mail client. You can run it on any machine. Just be sure not
to run two copies of it from two different places. Otherwise, the lock
files won't work properly. You'll have a train wreck in your folders. 


The INBOX is the until that is periodically polling the IMAP server,
so new email gets first reported to INBOX.




3. Handy Commands

Shift D		Decodes and saves MIME attachments

$ w		Saves an attachment to a file

C-c C-a         Attaches a file to an email composition

C-x C-s         Saves a file, such as the inbox

s               When viewing mail, hit "s" to save a message to a folder

d               Marks a mesage as delete. Hit three pound signs (###)
                to actually delete.


Following is how I open my personal  mail application and send a test email to 
myself. To send the mail, I hit Ctrl-c then Ctrl-d. Then, go to my
emacs inbox folder and look at my mode line. When mail arrives, the
text "Mail" will appear.


[gmcmillan@redd2212 ~]% mail gmcmillan
Subject: 
hi snake
yyy.Am I in body?

Cc: 
[gmcmillan@redd2212 ~]% 

Verify that a folder has been moved or created successfully by using
the "v" command, which stands for "visit".


To dynamically jump from one dir to another dir, use the tilde (~):

[gmcmillan@redd2212 spools]% pwd
/home/gmcmillan/Mail/spools
[gmcmillan@redd2212 spools]% cd ~/Procmail
[gmcmillan@redd2212 ~/Procmail]% pwd
/home/gmcmillan/Procmail
[gmcmillan@redd2212 ~/Procmail]% 

Also.. try using the Tab key to get commmand completion.


Installing VM
=============
1. Create a directory called Emacs under my home dir

2. When you expect to go back and forth between multiple directories
   often, enter "popd" or "pushd  shortcut. You don't have to re-type the
   return path again: 

[gmcmillan@suncs9 ~]% pushd ~jerry/emacs
~jerry/emacs ~ 
[gmcmillan@suncs9 ~jerry/emacs]% pwd
/home/jerry/emacs
[gmcmillan@suncs9 ~jerry/emacs]% 
[gmcmillan@suncs9 ~jerry/emacs]% ls -l
total 156
-rw-r--r--   1 jerry       30389 Aug 20 12:31 eperiodic.el
-rw-r--r--   1 jerry       77698 Aug 31  2000 gnats.el
-rw-rw-r--   1 jerry        2265 Nov  5  1999 lame.el
-rw-rw-r--   1 jerry        2591 Nov  5  1999 morse.el
-rw-r--r--   1 jerry       29221 Aug 31  2000 send-pr.el
lrwxrwxrwx   1 jerry           7 Sep 10 08:55 vm -> vm-6.96
drwxr-xr-x   3 jerry        4096 Sep 10 08:54 vm-6.96


3. Enter "tar" (tape archive) to grab (copy) a bunch of directories and file
   all at once. Tar preserves the timestamps too. Write an archive
   of a directory (and all of its sub directories) from Jerry's
   machine to my machine. The verticle bar (|) means take the standard
   output from one command and beat it into another command. The
   paranthesizing is a grouping that causes a sub shell. At one level
   it treats the parenthesis as a command, but inside it is really two
   commands. In our example, we want two things to be associated with
   what's on the other side of the pipe bar. Inside the sub shell, we
   going to cd back over to /emacs and run the "tar xf". The "x" means
   create. The "f" means extract. The "c" means create. We're running
   tar twice and piping the output from one to the other, which making
   one run in a different directory.


[gmcmi@suncs9 ~jerry/emacs] tar cf - vm-6.96 | (cd ~/emacs; tar xf - )

4. Return to my home dir by entering "popd":

[gmcmillan@suncs9 ~jerry/emacs]% popd
[gmcmillan@suncs9 ~]% 
[gmcmillan@suncs9 ~]% ls emacs
elisp_documentation_intro       vm                              vm-6.87
[gmcmillan@suncs9 ~]% cd emacs
[gmcmillan@suncs9 ~/emacs]% 

5. Cause the directory name with a version number in it to have a sync
   link with autoversion number in it. This makes it very easy to
   change out the version some day, if a new VM comes out. In this
   way, all our reference that we create in my magic will referent the
   directory called "vm" without have to change all the references:

[gmcmillan@suncs9 ~/emacs]% ln -s vm vm

6. Look at the sym link representation that point to the other directory:

[gmcmillan@suncs9 ~/emacs]% ls vm-6.87/
COPYING         vm-autoload.el  vm-folder.el    vm-menu.elc     vm-mouse.el     vm-search.elc   vm-undo.el      vm-window.elc
Makefile        vm-autoload.elc vm-folder.elc   vm-message.el   vm-mouse.elc    vm-sort.el      vm-undo.elc     vm.el
README          vm-byteopts.el  vm-imap.el      vm-message.elc  vm-page.el      vm-sort.elc     vm-user.el      vm.elc
base64-decode.c vm-delete.el    vm-imap.elc     vm-mime.el      vm-page.elc     vm-startup.el   vm-user.elc     vm.info
base64-encode.c vm-delete.elc   vm-license.el   vm-mime.elc     vm-pop.el       vm-startup.elc  vm-vars.el      vm.info-1
make-autoloads  vm-digest.el    vm-license.elc  vm-minibuf.el   vm-pop.elc      vm-summary.el   vm-vars.elc     vm.info-2
pixmaps         vm-digest.elc   vm-macro.el     vm-minibuf.elc  vm-reply.el     vm-summary.elc  vm-version.el   vm.info-3
qp-decode.c     vm-easymenu.el  vm-macro.elc    vm-misc.el      vm-reply.elc    vm-thread.el    vm-version.elc  vm.texinfo
qp-encode.c     vm-easymenu.elc vm-mark.el      vm-misc.elc     vm-save.el      vm-thread.elc   vm-virtual.el
tapestry.el     vm-edit.el      vm-mark.elc     vm-motion.el    vm-save.elc     vm-toolbar.el   vm-virtual.elc
tapestry.elc    vm-edit.elc     vm-menu.el      vm-motion.elc   vm-search.el    vm-toolbar.elc  vm-window.el
[gmcmillan@suncs9 ~/emacs]% ls -l vm
lrwxrwxrwx   1 gmcmillan       8 Jan  5  2001 vm -> vm-6.87/
[gmcmillan@suncs9 ~/emacs]% 

7. When the symlink is a directory, and I want to see the contents,
   I'll have to reference something below it by entering "ls vm/*". By
   default, when something is a symlink, he's only going to show me
   the value of the link (not what it points to):

[gmcmillan@suncs9 ~/emacs]% ls vm/*
vm/COPYING              vm/vm-easymenu.el       vm/vm-message.elc       vm/vm-save.el           vm/vm-user.elc
vm/Makefile             vm/vm-easymenu.elc      vm/vm-mime.el           vm/vm-save.elc          vm/vm-vars.el
vm/README               vm/vm-edit.el           vm/vm-mime.elc          vm/vm-search.el         vm/vm-vars.elc
vm/base64-decode.c      vm/vm-edit.elc          vm/vm-minibuf.el        vm/vm-search.elc        vm/vm-version.el
vm/base64-encode.c      vm/vm-folder.el         vm/vm-minibuf.elc       vm/vm-sort.el           vm/vm-version.elc
vm/make-autoloads       vm/vm-folder.elc        vm/vm-misc.el           vm/vm-sort.elc          vm/vm-virtual.el
vm/qp-decode.c          vm/vm-imap.el           vm/vm-misc.elc          vm/vm-startup.el        vm/vm-virtual.elc
vm/qp-encode.c          vm/vm-imap.elc          vm/vm-motion.el         vm/vm-startup.elc       vm/vm-window.el
vm/tapestry.el          vm/vm-license.el        vm/vm-motion.elc        vm/vm-summary.el        vm/vm-window.elc
vm/tapestry.elc         vm/vm-license.elc       vm/vm-mouse.el          vm/vm-summary.elc       vm/vm.el
vm/vm-autoload.el       vm/vm-macro.el          vm/vm-mouse.elc         vm/vm-thread.el         vm/vm.elc
vm/vm-autoload.elc      vm/vm-macro.elc         vm/vm-page.el           vm/vm-thread.elc        vm/vm.info
vm/vm-byteopts.el       vm/vm-mark.el           vm/vm-page.elc          vm/vm-toolbar.el        vm/vm.info-1
vm/vm-delete.el         vm/vm-mark.elc          vm/vm-pop.el            vm/vm-toolbar.elc       vm/vm.info-2
vm/vm-delete.elc        vm/vm-menu.el           vm/vm-pop.elc           vm/vm-undo.el           vm/vm.info-3
vm/vm-digest.el         vm/vm-menu.elc          vm/vm-reply.el          vm/vm-undo.elc          vm/vm.texinfo
vm/vm-digest.elc        vm/vm-message.el        vm/vm-reply.elc         vm/vm-user.el

vm/pixmaps:
audio_stamp-colorful.xpm        film-colorful.xpm               mime-xx.xbm                     recover-dn.xpm
audio_stamp-simple.xpm          film-simple.xpm                 mona_stamp-colorful.xpm         recover-up.xbm
autofile-dn.xbm                 gear-colorful.xpm               mona_stamp-simple.xpm           recover-up.xpm
autofile-dn.xpm                 gear-simple.xpm                 next-dn.xbm                     recover-xx.xbm
autofile-up.xbm                 getmail-dn.xbm                  next-dn.xpm                     reply-dn.xbm
autofile-up.xpm                 getmail-dn.xpm                  next-up.xbm                     reply-dn.xpm
autofile-xx.xbm                 getmail-up.xbm                  next-up.xpm                     reply-up.xbm
compose-dn.xbm                  getmail-up.xpm                  next-xx.xbm                     reply-up.xpm
compose-dn.xpm                  getmail-xx.xbm                  previous-dn.xbm                 reply-xx.xbm
compose-up.xbm                  help-dn.xbm                     previous-dn.xpm                 stuffed_box-colorful.xpm
compose-up.xpm                  help-dn.xpm                     previous-up.xbm                 stuffed_box-simple.xpm
compose-xx.xbm                  help-up.xbm                     previous-up.xpm                 undelete-dn.xbm
delete-dn.xbm                   help-up.xpm                     previous-xx.xbm                 undelete-dn.xpm
delete-dn.xpm                   help-xx.xbm                     print-dn.xbm                    undelete-up.xbm
delete-up.xbm                   message-colorful.xpm            print-dn.xpm                    undelete-up.xpm
delete-up.xpm                   message-simple.xpm              print-up.xbm                    undelete-xx.xbm
delete-xx.xbm                   mime-colorful-dn.xpm            print-up.xpm                    visit-dn.xbm
document-colorful.xpm           mime-colorful-up.xpm            print-xx.xbm                    visit-dn.xpm
document-simple.xpm             mime-colorful-xx.xpm            quit-dn.xbm                     visit-up.xbm
file-dn.xbm                     mime-dn.xbm                     quit-dn.xpm                     visit-up.xpm
file-dn.xpm                     mime-simple-dn.xpm              quit-up.xbm                     visit-xx.xbm
file-up.xbm                     mime-simple-up.xpm              quit-up.xpm
file-up.xpm                     mime-simple-xx.xpm              quit-xx.xbm
file-xx.xbm                     mime-up.xbm                     recover-dn.xbm
[gmcmillan@suncs9 ~/emacs]% 


8. Edit my .vm file, so it knows where my spool is located. When the
   mail comes in, it has to go somewhere before I ask for the mail. A
   spool is like a queue. The mail comes in and waits somewhere before
   someone asks for it. My act of asking for mail, takes it from the
   spool and moves it to me inbox. All this happens before emacs gets
   the mail. 



My initail .vm file
===================
;;;;	Yo! emacs!  This here is: -*-emacs-lisp-*-

(setq vm-primary-inbox "~/Mail/INBOX")
(setq vm-crash-box "~/Mail/INBOX.CRASH")
(setq vm-folder-directory "~/Mail/")
(setq vm-confirm-new-folders t)
(setq mail-archive-directory "~/Mail/")

;; Inserts "Re:" on all replies

(setq vm-reply-subject-prefix "Re: ")

;; FCC: myself on all outgoing messages

(setq mail-archive-file-name (expand-file-name "~/Mail/sent-items"))

;; Strip out my address when replying

(setq vm-reply-ignored-addresses '("^greg@procket.com" "[ \<]gmcmillan@procket.com"))

(setq vm-spool-files
      (list (concat "imap:mail:143:inbox:login:"
		    (getenv "USER") ":*")
	    ;; This one shouldn't be necessary, but until I see that
	    ;; it's impossible for anything to get into the
	    ;; old-fashioned spool I'll keep it.
	    (concat "/var/spool/mail/" (getenv "USER"))))

;; Deciding how frequently emacs should hang waiting for our flaky IMAP
;; server is a tough call.
(setq vm-mail-check-interval 150)

;; Wait until I ask to see it.
(setq vm-auto-decode-mime-messages nil)
;(setq vm-auto-decode-mime-messages t)

(setq vm-mime-external-content-types-alist
      '(
	("text/html" 	"netscape")
	("image/gif" 	"xv")
	("image/jpeg" 	"xv")
	("video/mpeg" 	"mpeg_play")
	("video" 	"xanim")
	("application/postscript" "ghostview")
	("application/pdf" "acroread")
	)
      )
(setq vm-infer-mime-types t)
(setq vm-mime-8bit-text-transfer-encoding '8bit)

;; There's something rum about all the crud between the obvious invocation
;; name and the real program that flummoxes emacs.  This little subversion
;; makes it work anyway.  Maybe I should install my own local netscape.
(setq vm-netscape-program "/tools/pkgs/netscape/default/netscape")



Jerry's Latest .vm (as of 4/13/04)
=================================

[gmcmillan@miata ~]% more ~jerry/.vm

;;;;	Yo! emacs!  This here is: -*-emacs-lisp-*-

;;(vm-set-debug-flags)

(setq vm-primary-inbox "~/Mail/INBOX")
(setq vm-crash-box "~/Mail/INBOX.CRASH")
(setq vm-folder-directory "~/Mail/")
(setq vm-confirm-new-folders t)
(setq mail-archive-directory "~/Mail/")

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

;(setq vm-mutable-windows nil)
(setq vm-warp-mouse-to-new-frame t)
(setq vm-startup-with-summary 50)
(setq vm-auto-center-summary t)
(setq vm-circular-folders nil)
(setq vm-auto-next-message nil)
(setq vm-preview-lines nil)
(setq vm-follow-summary-cursor t)
(setq vm-strip-reply-headers t)
;(setq vm-in-reply-to-format "%i from %f")
(setq vm-included-text-attribution-format
      "%F wrote (on %w %-3.3m %2d, at %h):\n\n")
(setq vm-included-text-prefix "> ")
;;(setq vm-thread-using-subject nil)

;; Fill the junk from netscape and mac mouth-breathers.
;; (setq vm-fill-paragraphs-containing-long-lines 75)
;; The above creates more trouble than it fixes.
(setq vm-fill-paragraphs-containing-long-lines nil)

(setq vm-visible-headers
      '("Resent-" "From:" "Sender:" "To:" "Apparently-To:" "Cc:"
	"Subject:" "Date:" "Newsgroups" "In-Reply-To:"))

;; Stick with rfc934 most of the time.
;(setq vm-forwarding-digest-type "mime")
;(setq vm-forwarding-digest-type "rfc1153")
(setq vm-forwarding-digest-type "rfc934")

(setq vm-forwarded-headers
      '("From:" "Apparently-From" "To:" "Apparently-To:" "Cc:" "Subject"
	"Date" "In-Reply-To:" "Newsgroups" "Organization:" "Keyword"))
(setq vm-unforwarded-header-regexp nil)

;; uses vm-version, so it has to be in ~/.vm instead of ~/.emacs
;(setq mail-default-headers (concat
;      "X-Mailer: VM Version " (vm-version) " with Emacs " emacs-version "\n"))

(setq vm-flush-interval t)
(setq vm-auto-folder-alist
      '(("Subject"
	 ("Weekly Status" . "wstatus") ("USENIX events" . "usenix")
	 ("TTL" . "ttl") ("Notification of Payment" . "payment")
	 )
	("To"
	 ("npu" . "npu") ("ucoders" . "ucoders") ("platform-sw". "plat")
	 ("npu-bringup" . "bringup")
	 )
	("From"
	 ("owner-nba*" . "nba")
	 ("action" . "sysadmin")
	)))

;; Wait until I ask to see it.
;(setq vm-auto-decode-mime-messages nil)
(setq vm-auto-decode-mime-messages t)

(setq vm-mime-external-content-types-alist
      '(
	("text/html" 		"netscape")
	("image/gif" 		"xv")
	("image/jpeg" 		"xv")
	("video/mpeg" 		"mpeg_play")
	("video"		"xanim")
	("application/postscript" "ghostview")
	("application/pdf" 	"acroread")
	;;("application/msword"	"wordview")
	("application/msword"	"viewchooser")
	("application/vnd.ms-powerpoint" "viewchooser")
	("application/vnd.ms-excel" "viewchooser")
	("application/staroffice" "viewchooser")
	)
      )
(setq vm-infer-mime-types t)
(setq vm-mime-8bit-text-transfer-encoding '8bit)
(setq vm-mime-base64-decoder-program "~/bin/base64-decode")
(setq vm-mime-base64-encoder-program "~/bin/base64-encode")

;; Don't look for an NFS-mounted copy of netscape.
;; (if (and (string= system-type "gnu/linux")
;; 	 (file-executable-p "/usr/bin/netscape"))
;;     (setq vm-netscape-program "/usr/bin/netscape"))

;; There's something rum about all the crud between the obvious invocation
;; name and the real program that flummoxes emacs.  This little subversion
;; makes it work anyway.  Maybe I should install my own local netscape.
(setq vm-netscape-program "/tools/pkgs/netscape/default/netscape")
;; use netscape even when I have w3 loaded.
(setq vm-url-browser 'vm-mouse-send-url-to-netscape)

;; emacs 21 wants to do this by default.  I'd rather get the space back.
(setq vm-use-toolbar nil)

;; an experiment I'll probably regret:
(if (>= emacs-major-version 21)
    (add-hook 'vm-select-message-hook
	      '(lambda () (smiley-region (point-min)
					 (point-max)))))

;; friedman@netscape.com (Noah Friedman), gnu.emacs.vm.info, Feb 6, 97
;; Adapted from an idea by Bryan O'Sullivan <bos@serpentine.com>
(defadvice vm-mime-make-multipart-boundary (after ivm-spook-mime activate)
  (or (boundp 'spook-phrases-file)
      (load "spook"))
  (let ((cookies (cookie-snarf spook-phrases-file "fnord" ""))
        (illegal-re "[^A-Za-z0-9/+_-]")
        (boundary-string "")
        (tail (substring ad-return-value (/ (length ad-return-value) 2)))
        (seen nil)
        (new nil)
        (count (1+ (random 3))))
    (while (not (zerop count))
      (setq new (aref cookies (random (length cookies))))
      (cond ((memq new seen))
            (t
             (setq seen (cons new seen))
             (setq count (1- count)))))
    (setq boundary-string (mapconcat 'identity seen "-"))
    (save-match-data
      (while (and (<= count (length boundary-string))
                  (string-match illegal-re boundary-string count))
        (aset boundary-string (match-beginning 0) ?_)
        (setq count (match-end 0))))
    (setq ad-return-value (concat boundary-string "-" tail))))


;; From: Noah Friedman <friedman@splode.com>
;; Subject: Re: delete messages by message-id?
;; Newsgroups: gnu.emacs.vm.info
;; Date: 06 Dec 2001 23:42:33 -0800
(add-hook 'vm-arrived-messages-hook 'vma-kill-duplicate-messages-by-message-id)

(defun vma-kill-duplicate-messages-by-message-id (&optional mp)
  "Mark as deleted any message with a duplicate message ID.
Any undeleted message which has a Message ID indentical to that of another
undeleted message in the same folder, is marked for deletion."
  (interactive)
  (vm-select-folder-buffer)
  (vm-check-for-killed-summary)
  (vm-error-if-folder-read-only)
  (vm-error-if-folder-empty)
  (let ((htbl (make-vector 103 0))
        (n 0)
        (case-fold-search t)
        mid)
    (unless mp
      (setq mp vm-message-list))
    (while mp
      (cond ((vm-deleted-flag (car mp)))
            (t
             (setq mid (vm-su-message-id (car mp)))
             (or mid (debug (car mp)))
             (when (intern-soft mid htbl)
               (vm-set-deleted-flag (car mp) t)
               (setq n (1+ n)))
             (intern mid htbl)))
      (setq mp (cdr mp)))
    (and (interactive-p)
         (message "%d duplicate%s marked deleted" n (if (= n 1) "" "s")))
    (vm-update-summary-and-mode-line)
    (when vm-move-after-killing
      (let ((vm-circular-folders (and vm-circular-folders
                                      (eq vm-move-after-killing t))))
        (vm-next-message 1 t executing-kbd-macro)))
    n))


Email Aliases
=============
Define mail aliases in a file named `~/.mailrc'. 

To define an alias in `~/.mailrc', write a line in the following format: 

alias <shortaddress> <fulladdresses>



The Difference Between .emacs and .vm
======================================
From: Jerry Kreuscher <jerry@Procket.com>
To: gmcmillan@Procket.com
Subject: Question: Re: test3
Date: Tue, 22 May 2001 09:42:58 -0700

Greg McMillan wrote (on Tuesday May 22, at 09:23:31):

> Question.
> 
> What's the primary difference between .emacs and .vm? 
> 
> .emacs controls the Emacs environments, controls, and indicators.
> 
> Whereas .vm controls VM?
> 
> I often don't know what file to modify when. 

Yes, you understand it.  Use .vm for things specific to vm.  The
boundary might seem ambiguous because there is a little about vm in
.emacs, but that stuff is about how to find vm, and not how to make it
work once it's been found.  vm has to get found before there's any
reason to care about the .vm file.

This auto-fill fix is more general.  It applies to all text-mode
buffers.  If you'd rather not have it in all text mode buffers, we can
cobble it into a vm-specific mode-hook.


VM Tuning
=========
Documentation in vm-vars.el

See /home/gmcmillan/emacs/vm-6.87/vm-vars.el

Do not modify this file because it's part of the actual VM program. Only read this file.


VM Upgrading
============

> 1. I go to http://www.wonderworks.com/vm/download.html
> 
> 2. Download "vm-7.18.tar.gz" to my /home/gmcmillan/emacs/vm directory

Don't use .18.  It has a weird MIME bug.  Grab .15 from ~jerry/src/vm-7.15.tar.gz

> 3. Since I'm on a Linux box, do this:
> 
>    gunzip vm-7.18.tar.gz
>    tar xvf vm-7.18.tar.gz

You can combine these as:  tar zxf <filename>
The v switch only put more stuff on your screen.

My habit is to expand the tar file in $HOME/emacs.  That creates a
subdir vm-<version>.  Then I cd to the new directory and type make
there.  After that back to $HOME/emacs where I create a symlink named
vm to the new directory:

    tar zxf vm-7.15.tar.gz
    cd vm-7.15
    make
    cd ..
    ln -s ~/emacs/vm-7.15 ~/emacs/vm

In my .emacs I've added "~/emacs/vm" to my load-path.

There are other ways.  This works for me.  Before pointing emacs at a
new vm, though, quit the current one.  You should probably quit emacs,
too, because there's no guarantee that loading a new version overrides
everything done by a prior load of the previous one.

>    question: do I need to do a "make install" or something like that? 
> 
> 4. Tell .vm and .emacs to pick up the new vm. I don't see anything
>    obvious in the files that needs to change. Am I missing something?

It gets found by your load-path.

I haven't time to grovel through your dot-files.  If they worked with
the old version, they should work for the new one.  You already have a
load-path item pointing to a vm, so put the new in that place and make
there.  mv the old one aside as a precaution.


10. Checkpoint Files

Every so many key strokes, vm is writing to a checkpoint file, such as
#<filename>#. This file protects you from a power outage or a line
going down. If data is missing from a checkpoint file, maybe vm
didn't have enough time to write it before the file/connection got
clobbered. The only way you could not lose data is if vm wrote to disk
each time you typed a character. In this case, the time hit would drive you nuts. 

Tip: Each time you get new mail do a save. Especially over an analog modem link. 



12. Testing INBOX File Recovery

1. In the INBOX, delete one email.

2. Kill emacs then restart it.
 
3. Enter "M-x recover-file" and hit return

4. Enter "INBOX" and hit return. First, tell emacs the name of the real
   file. Then, it'll come back and asks if the checkpoint file
   (#INBOX#) that emacs has for you is a match. Say "yes" if it is a
   match. 

5. Enter "yes"

Now start fetching mail after you do a save. Notice that the
thing you deleted is not deleted. 



12. Setting Up Clickable URLs

Put this line in your .vm

(setq vm-netscape-program "/tools/pkgs/netscape/default/netscape")

>  > ;; There's something rum about all the crud between the obvious invocation
>  > ;; name and the real program that flummoxes emacs.  This little subversion
>  > ;; makes it work anyway.  Maybe I should install my own local netscape.





Stripping out my email address when sending an email
====================================================
From: Jerry Kreuscher <jerry@Procket.com>
To: gmcmillan@Procket.com
Subject: Question: setq vm-reply-ignored-addresses 
Date: Thu, 5 Apr 2001 16:56:11 -0700

No comma.  Separate them by white-space.  Whether than mean putting
them on on separate lines is up to you.

Greg McMillan wrote (on Thursday Apr  5, at 16:28:39):

> Hi Jerry,
> 
> I'm updating .vm to strip out my email addresses when I reply to a
> message. The VM web page says I should use the following
> variable. However, how do I enter my two address? Side-by-side
> separated by a comma or on separate lines?

> 
> VM says use this:
> (setq vm-reply-ignored-addresses '("^username@example.com"
>                                    "[ \<]username@example.com"))
> 
> Enter my info like this?
> (setq vm-reply-ignored-addresses '("^greg@procket.com"
>                                    "[ \<]gmcmillan@procket.com"))
> 
> or.... like this?
> (setq vm-reply-ignored-addresses '("^greg@procket.com", "gmcmillan@procket.com"))



13. Sending a Test Email to Myself

[gmcmillan@suncs9 ~]% mail gmcmillan
Subject: Test Email
Hello,

Did you get this, Greg?
^C  <<------------------------------------Enter Ctrl C here
(Interrupt -- one more to kill letter) <<-----Enter Ctrl D here
EOT <<------------------------------------Enter Return here
[gmcmillan@suncs9 ~]% 



Bulk Delete Same Author in Folder
----------------------------------
1. Shift m + a (mark all messages in current folder by the same author)
2. Shift m + n (prefix my next global command with vm-next-command-uses-marks)
3. d (applies the delete function to all the marked messages)


Bulk Delete all in Folder
-------------------------
1. "Shift m" + "m" (mark all messages in current folder)
2. "Shift m" + "n" (prefix my next global command with vm-next-command-uses-marks)
3. d (applies the delete function to all the marked messages)

Tip: To undo marks from all messages, enter Shift m + u. 

     To unmark a specified region in the summary highlight the interesting
     region, then enter Shift m + r to unmark.


IMAP
----

a) authentication

It's happening because of the "(getenv "USER")" part of your
vm-spool-files setting.  If you always intend to be "gmcmillan" in
this context and the environment variable USER is liable not to be
consistent with that, then the environment variable shouldn't be used
for this.  Use your username instead.  That is:

(setq vm-spool-files
      (list (concat "imap:mail.gregdella.us:143:inbox:login:"
                    "gmcmillan" ":*")))

Greg McMillan wrote (on Monday May 24, at 23:25:58):

> Hey Jerry, :-)
> 
> After 2+ hours poking around on the web, I finally need to ask you the
> question...
> 
> I'm now using vm on my home system to poll an imap server (named
> "mail.gregdella.us", provided by a web hosting outfit. 
> 
> .vm contains this:
> 
> (setq vm-spool-files
>       (list (concat "imap:mail.gregdella.us:143:inbox:login:"
>                     (getenv "USER") ":*")))
> 
> Here's my problem. When I "M-x vm" from within emacs, I get this:
> 
>     IMAP password for root@mail.gregdella.us [inbox]:
> 
> My IMAP account username is actually "gmcmillan", not "root". Yes, I'm logged
> into the local system as "root". But I have no idea how vm is prepending
> that. 
> 
> Then I try changing it to:
> 
>     "imap:mail.gregdella.us:143:inbox:login:gmcmillan"
> 
> But then I get:
> 
>     IMAP password for gmcmillanroot@mail.gregdella.us [inbox]:
> 
> ARrrr.....


b) sendmail

Subject: /var/spool/Mail and MailQ
Date: Thu, 3 Jun 2004 13:21:32 -0700


see if things are piling up there

also see sendmail.com, if I choose to use it

IMAP is a mail delivery agent to my INBOX. It does not send mail. SMTP is the outgoing mail relay agent,
which usually needs to be authenticated due to the large amounts of
spam these days. 


15. Embellishment

If you're still using vm when you get to emacs-21, you'll get a little
kick out of having this in your .vm:

(if (>= emacs-major-version 21)
    (add-hook 'vm-select-message-hook
	      '(lambda () (smiley-region (point-min)
					 (point-max)))))


16. References

Standard VM:

	http://www.wonderworks.com/vm/

	http://www.wonderworks.com/vm/vm-faq-7.html


Tunning VM Display Settings:

	http://www.wonderworks.com/vm/user-manual/vm_14.html#SEC25

