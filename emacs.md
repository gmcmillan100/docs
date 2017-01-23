
                           Emacs
                           =====

Table of Contents:

 1. Introduction
 2. Building Blocks
 3. The .emacs File
 4. Handy Commands
 5. Text Modification
 6. Emacs Shell
 7. Buffer Management
 8. Telnet
 9. Emacs with/without X
10. Evaluating Expressions
11. Creating Files
12. File/Folder Recovery
13. Elisp Introduction
14. Gnats
15. More .emacs Examples
16. References
17. Unresolved Issues
18. VT100 Terminal Settings
19. SMTP Data Encoding Error


1. Introduction

Emacs is a Swiss Army Chain Saw for programmers. It's not only an
editor. You can create shells, read and compose email, read and
compose net news, telnet, ftp, etc. Emacs gives you a single coherent
way of performing many taks instead of bouncing between multiple
applications and remembering many different keystrokes for the same
operations.

An emacs shell buffer provides a narrow and nearly infinite transcript
of what I've been doing. The max line count is about 10K lines. It
gives me a log of what I've been doing all week. I can do searches
within my long shell buffer logs too. The buffer is just like a file
that I'm editing.


2. Building Blocks

To start emacs, enter "emacs &".

When emacs starts up, it looks in your home dir for a .emacs settings
file that contains expressions to perform different operations. This
file changes the bare default settings used by emacs. The .emacs file
you create is the center of the universe.

If you accept settings from other people, you'll end up with a bunch
of stuff you don't understand. This problem makes it hard to progress
in the long run. Take things slow and one step at a time. Don't become
a victim of magic. Understand why you do what you do.  

Emacs is modeless. With vi, you have insert mode. In emacs, you're
always in input mode. Issue commands by using prefix characters (Ctrl x). 

Exiting emacs without properly saving files creates recovery
problems. Always save files. To recover, enter M-x recover-<tab>RETURN.


3. The .emacs File

Note: To insert a comment, use one or two ";".

Following is Greg's file at Procket. For more .emacs examples, see
the section "More .emacs Examples" later in this document.

[gmcmillan@miata ~]% more .emacs
;Greg's Lisp code for emacs

(setq load-path (append '("~/emacs/vm"
;;                        "~/emacs/gnus/lisp"
                           "~/emacs/mailcrypt"
                           "~/emacs"
;;                         "/usr/share/emacs/site-lisp/w3"
                           )
                        load-path))

(server-start)

(autoload 'vm "vm" "Start VM on your primary inbox." t)
(autoload 'vm-other-frame "vm" "Like `vm' but starts in another frame." t)
(autoload 'vm-visit-folder "vm" "Start VM on an arbitrary folder." t)
(autoload 'vm-visit-virtual-folder "vm" "Visit a VM virtual folder." t)
(autoload 'vm-mode "vm" "Run VM major mode on a buffer" t)
(autoload 'vm-mail "vm" "Send a mail message using VM." t)
(autoload 'vm-submit-bug-report "vm" "Send a bug report about VM." t)

;No scroll bar wanted
(scroll-bar-mode -1)

;; Show the time and load-average in the mode-line.
(display-time)

;; Enable alien accents and ligatures.
(standard-display-european t)

(require 'paren)

;; They made us have to ask in version 20.
(if (>= emacs-major-version 20)
    (show-paren-mode))

;; Make sure that text-mode will auto-fill.
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Turn on global font-lock if it's available.
(cond ((fboundp 'global-font-lock-mode) (global-font-lock-mode t)))

;; Double the default.  Computers are fast these days, right?
(setq font-lock-maximum-size (* font-lock-maximum-size 2))

;Delete unnecessary auto-save files
(setq delete-auto-save-files t) 

;Default mode is text-mode
(setq default-major-mode 'text-mode)  

;Split the window vertically
;(split-window-vertically)

;Disable auto-saving. The darn SUN machines are slow to save!!!
(setq auto-save-default nil)

;Create a keymap that programs "C-h" (occurs when I type <backspace>
 on my 
;dumb terminal keyboard) to send a backward delete function. Had to do
 this to get 
;the backspace key to work from my home-pc.

(global-set-key "\C-h" 'delete-backward-char)

(set-foreground-color "White")
(set-background-color "Black")
(set-cursor-color "Red")
(set-mouse-color "White")

(set-frame-font
"-sony-fixed-medium-r-normal--16-120-100-100-c-80-*-1")


4. Handy Commands

C-s	Incremental search forward (isearch-forward).
	Type another C-s to move to the next occurrence of the search string. 

C-r 	Incremental search backward (isearch-backward)
RET	Stops the search
DEL	Cancels the last character of search string
C-v	Move forward one screenful
M-v	Move backward one screenful
C-f	Move forward a character
C-b	Move backward a character
M-f	Move forward a word
M-b	Move backward a word
C-n	Move to next line
C-p	Move to previous line
C-a	Move to beginning of line
C-e	Move to end of line
M-a	Move back to beginning of sentence
M-e	Move forward to end of sentence
C-v	Move forward one screenful
M-v	Move backward one screenful

C-l	Clear screen and redisplay all the text, moving the text around the cursor
        to the center of the screen. (That's control-L, not control-1.)

C-h c <command>	   Display a brief explanation of the online documentation
C-h k <command>	   Display a full explanation of the online documentation

C-x u	Undo. It remembers a history of operations.

<Delete>     delete the character just before the cursor
C-d   	     delete the next character after the cursor

C-x DEL	     Kill back to beginning of sentence
M-k	     Kill to end of sentence
M-<Delete>   kill the word immediately before the cursor
M-d	     kill the next word after the cursor

C-k	     kill from the cursor position to end of line

M-k	     kill to the end of the current sentence


			  Previous line, C-p
				  :
				  :
   Backward, C-b .... Current cursor position .... Forward, C-f
				  :
				  :
			    Next line, C-n



M-x ispell-buffer        Run spell check on buffer

M-x ispell-region        First mark a region (ctrl spacebar), then
                         move point to end of region, then type M-x
			 ipsell-region

"ESC" "shift >" Go to end of file

"ESC" "shift <" Go to top of file

M->		Move to the end of the buffer. Alt+Shift+> in that
		order. It has the cool side-effect of setting mark at the place where you
		did it, so the marked region will include everything from where you
		did it to the end.

C-x C-x		Interchange mark and point. Any time you you operate
		on a marked region, you can check where that region
		is. It means "swap point and mark".

C-x C-f		Find a file, or create a new file

                If you see the same filename but with a tilda (~)
		after it, that file is the backup file automatically
		created by Emacs. If needed, you can revert to the
		previous copy of the file. Checkpoint files (#) are a little
		different from backup files (~). 

lpr-buffer	Prints a buffer with no headers or page delimeters

C-x C-e		Evaluate current expression

		For example, set point (the cursor) at the end of a
		line (expression) and C-x C-e to evaluate the current
		expression where point is. For example, do that at the
		end of "(display-time)". You'll see a time stamp appear
		in the mode field.   

C-x k		Kills the current buffer. Use it if you don't want to
		save what you've been working on.  

M-x		Called "meta x". It's the same as Alt X

M-x shell	Bring up a second shell, which you can leave open all week long

C-x 52.		Brings up another frame within emacs. You can be editing
		one file in a frame, yet continue having another emacs shell
		buffer open doing something else. However, you must
		rename the second shell by entering M-x rename-buffer.
		Run 4 or 5 emacs frames to multitask. For example,
		have a dedicated open frame for email. 

		To close a frame, enter C-x 50

C-e		Takes cursor to the end of a line

Ctrl-d          Delete characters inside a file

Ctrl-a          Moves point to the beginning of a line, from anywhere on a line

<tab>		Command completion

C-g		Quits the last operation

//		Any time you have a "//" in the command field window, it
		means Emacs is telling you you're root. When root, you
		can say // or get rid of the tilda (~) when finding files.
 
-fn <typeface>	To change the type face in the Emacs session. You can
		change it via command line or Shift <left-mouse-button>

C-x b		To change the selected buffer in the selected window

C-x 2		Creates a second window within one frame

C-x 0		Closes the current window within one frame (goes from 2 windows to 1 window)

C-x o		Jumps to the other (o) window within the same frame. A toggle.

C-x 4 f <path>	Jump to the other window, visit a file, and move point
		to that file.

                When you have only one window open within one emacs
                frame, entering this command sequence will auto-open
                a second window and visit the file. 

M-x text-mode	When you edit files of text in a human language, it's
		more convenient to use "text-mode" rather than
		"fundamental-mode".  To enter Text mode, type `M-x text-mode'.


5. Text Modification

After opening a new empty file, enter text mode (Meta X text-mode). 

There is a way to make text-mode the default mode when no other mode is
specified. 

Text-mode is inferred if ".txt" is at the end of the file you're
openning. Many of the modes are inferred. If editing a file that
ends in .c or .m for example, Emacs knows it should launch C Mode or
Assembly Mode. It also knows that .html maps to HTML mode. Notice how
Emacs nicely formats the tags of a .html file when you open it in an
Emacs buffer.



6. Emacs Shell

You can run a shell inside an Emacs buffer. Use a "Ctrl-C" prefix inside
shell mode, so Emacs knows to apply the following command to the shell
instead of to Emacs.



7. Buffer Management

Ctrl B -- Switch to a new buffer

Ctrl X Ctrl B -- Get a list of the current open buffers


8. Telnet

Mx telnet <return>
type in name or address <return>

Connects to remote host in Telnet Mode. Don't try to
telnet to a host in Fundamental Mode. Emacs does not behave well with
telnet in that mode.

Use a "Ctrl-C" prefix inside shell mode, so Emacs knows to apply the
following command to the shell instead of to Emacs.


9. Emacs with/without X

In the .emacs file, tell Emacs about emacs instead of telling X about emacs.

You can run emacs outside of X. Invoke it inside your shell by doing:

	 emacs -nw


10. Evaluating Expressions

Insert point immediately after the expression and press C-x C-e. The
"C-e" stands for "evaluate." Emacs will evaluate the expression an
immediately apply it to the .emacs running configuration. The changes
take an immediate effect. This shortcut is useful for test running
expressions before you put then into the .emacs file. 

EX:

;; Make sure that text-mode will auto-fill.
(add-hook 'text-mode-hook 'turn-on-auto-fill)


Put "point" immediately after the the closing ')' of the
expression and type C-x C-e (ctrl-x ctrl-e).  That evaluates the
expression of the benefit of what's currently running -- a very useful
thing to do sometimes.


11. Creating Files

Use buffers for everything. Edit a new buffer with that name then save
it with the specified name.  

To do this, enter C-x C-f and specify the new (not found) file
name. Emacs will say it does not exist, but that's okay. By default,
emacs will save that file to the name specified.

Sometimes you might change your mind and decide to not save the buffer
(the file). Just kill the buffer w/o saving it.


12. File/Folder Recovery

Occurs when you quit without saving. You won't get this noise
if you undo changes and save things in an orderly way. Otherwise,
emacs will think you had a power outage and the work needs to be recovered
from a backup file. Periodically between keystrokes, emacs creates
little checkpoint files. Emacs asks if there are edits in the
checkpoints that you want to recover. 


13. Elisp Introduction

Great tutorial here:
http://www.delorie.com/gnu/docs/emacs-lisp-intro/emacs-lisp-intro_toc.html#SEC_Contents

look at the docs in emacs_lisp_doc_intro 


14. Gnats

Mx summ-pr

Add this to your .emacs file. However, note that gnats version 4 does
not work with this.

;;===============GNATS=================
(setq load-path
       (append load-path
        '("/tools/pkgs/gnats/default/share/emacs/lisp")))

;;/tools/share/pkgs/gnats/3.113.1/share/emacs/lisp

(setq exec-path
       (append '("/tools/pkgs/gnats/default/bin") exec-path))

(autoload 'edit-pr "gnats"
   "Command to edit a problem report." t)
(autoload 'view-pr "gnats"
   "Command to view a problem report." t)
(autoload 'unlock-pr "gnats"
   "Unlock a problem report." t)
(autoload 'query-pr "gnats"
   "Command to query information about problem reports." t)
(autoload 'send-pr-mode "send-pr"
   "Major mode for sending problem reports." t)
(autoload 'send-pr "send-pr"
   "Command to create and send a problem report." t)
(autoload 'gnats-mode "gnats"
	  "Major mode for editing of problem reports." t)
(autoload 'summ-pr "gnats"
   "Command to display a summary listing of problem reports." t)
(autoload 'change-gnats "gnats"
   "Change the GNATS database in use." t)

;;query-pr summary
(setq gnats::format-string "%5n %5s %j\n")
[

15. More .emacs Examples

15.1 Jerry

(setq load-path (append '("~/emacs/vm"
;;			  "~/emacs/gnus/lisp"
			   "~/emacs/mailcrypt"
			   "~/emacs"
;;			   "/usr/share/emacs/site-lisp/w3"
			   )
			load-path))
(setq Info-default-directory-list
      (append '("~/emacs/vm"
;;		"~/emacs/gnus/texi"
		)
	      Info-default-directory-list))

(server-start)

(autoload 'vm "vm" "Start VM on your primary inbox." t)
(autoload 'vm-other-frame "vm" "Like `vm' but starts in another frame." t)
(autoload 'vm-visit-folder "vm" "Start VM on an arbitrary folder." t)
(autoload 'vm-visit-virtual-folder "vm" "Visit a VM virtual folder." t)
(autoload 'vm-mode "vm" "Run VM major mode on a buffer" t)
(autoload 'vm-mail "vm" "Send a mail message using VM." t)
(autoload 'vm-submit-bug-report "vm" "Send a bug report about VM." t)

;; Just in case I accidentally use the menu bar...
(define-key menu-bar-tools-menu [rmail] '("Read Mail" . vm))
(define-key-after menu-bar-tools-menu [smail] '("Send Mail" . vm-mail) 'rmail)

;; GNATS things
(autoload 'edit-pr "gnats" 
  "Command to edit a problem report." t)
(autoload 'view-pr "gnats"
  "Command to view a problem report." t)
(autoload 'unlock-pr "gnats"
  "Unlock a problem report." t)
(autoload 'query-pr "gnats"
  "Command to query information about problem reports." t)
(autoload 'send-pr-mode "send-pr"
  "Major mode for sending problem reports." t)
(autoload 'send-pr "send-pr"
  "Command to create and send a problem report." t)

;; Things I want only for the emacs that runs and displays on my desk.
(cond ((not (eq window-system 'x)))
      ((not (and ;; (or (string= (system-name) "hera.microunity.com")
                 ;;     (string= (system-name) "hera"))
                 (eq (string-match "^:0" x-display-name) 0)
                 (eq (match-end 0) 2))))
      (t
       (let ((no-minibuffer  '((minibuffer . none))))
        ; No frame gets its own minibuffer.
         (setq initial-frame-alist
               (append no-minibuffer
                       '((user-position . t)
                         (top . 55) (left . 635) (height . 57))
                       initial-frame-alist))
         (setq vm-frame-parameter-alist
               '((primary-folder
                  ((user-position . t)
                   (left . 0) (top . 300) (height . 42)))
                 (folder ((height . 40)))
                 (composition ((height . 45)))
                 ))
         (setq default-frame-alist
               (append no-minibuffer
                       '((height . 45))
                       default-frame-alist))

         ; Set minibuffer frame position.
         (setq minibuffer-frame-alist
               (append '((user-position . t)
                         (top . 0) (left . 635))
                       minibuffer-frame-alist))
         )))

;; I should combine this with the same test above.
(if (eq window-system 'x)
    ;; It's a progn because I plan to expand this when I have time.
    (progn
      (setq x-pointer-shape x-pointer-left-ptr)
      ))

;; Show the time and load-average in the mode-line.
(display-time)
;; Enable alien accents and ligatures.
(standard-display-european t)

;; Reduce the number of false hits.  What I do is simpler than the default.
;; default is: (setq shell-prompt-pattern "^[^#$%>\n]*[#$%>] *")
(setq shell-prompt-pattern "^[-0-9a-zA-Z_]+> ")

(require 'paren)
;; They made us have to ask in version 20.
(if (>= emacs-major-version 20)
    (show-paren-mode))

;; Where to put stuff while I try version 21.
(if (eq emacs-major-version 21)
    (progn (setq display-time-use-mail-icon t)
	   (tool-bar-mode nil)
	   (auto-image-file-mode t)))

;; try this w3 stuff for a while
;; (This is where I installed it on my usual system.)
(if (and (file-exists-p "/local/0/jerry/src/emacs-20.7/site-lisp/w3.el")
	 ;; temp hack -- emacs21 doesn't like this stuff.
	 (eq emacs-major-version 20))
    (progn (require 'w3-auto "w3-auto")
	   (provide 'w3-init)))

;; Make sure that text-mode will auto-fill.
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; I think an emacs scroll bar is silly
(scroll-bar-mode nil)

;; Turn on global font-lock if it's available.
(cond ((fboundp 'global-font-lock-mode) (global-font-lock-mode t)))
;; Double the default.  Computers are fast these days, right?
(setq font-lock-maximum-size (* font-lock-maximum-size 2))

(setq gnus-default-nntp-server "news.procket.com")
(setq gnus-use-generic-from nil)
(setq gnus-auto-select-first nil)
(setq gnus-show-all-headers nil)
(setq gnus-default-article-saver 'gnus-summary-save-in-mail)
(setq gnus-large-newsgroup 80)
(setq gnus-subscribe-newsgroup-method 'gnus-subscribe-alphabetically)
(setq gnus-read-active-file 'some)
(setq gnus-check-new-newsgroups 'ask-server)
(setq gnus-inhibit-startup-message t)
;; I've added the group description.
(setq gnus-group-line-format "%M%S%p%5y: %(%-25g%) %D\n")
;; I've substituted the From: addr for the (often too cute) name field.
(setq gnus-summary-line-format "%U%R%z%I%(%[%4L: %-20,20F%]%) %s\n")
;;(setq gnus-local-organization "Henry Chinaski & Associates")
(setq gnus-message-archive-group nil)

; gnus 5.3 doesn't use mail-citation-hook
(setq message-cite-function 'sc-cite-original)
;; Lose the "sender:" header.  There's nothing wrong with my "from:" field.
(setq message-syntax-checks '((sender . disabled)))

;; Makes gnus get the "From:" field right; sendmail doesn't need this help.
(setq mail-host-address "procket.com")

;; Something rum about this environment makes an unsightly header about
;; X-Authentication-Warning come out it I don't set this.
(setq user-mail-address "jerry")

;; Get gnus and vm singing from the same page.
(setq gnus-mail-reply-method 'gnus-mail-reply-using-vm)
(setq gnus-mail-forward-method 'gnus-mail-forward-using-vm)
(setq gnus-mail-other-window-method 'gnus-mail-other-window-using-vm)

;;; Supercite stuff
(autoload 'sc-cite-original     "supercite" "Supercite 3.1" t)
(autoload 'sc-submit-bug-report "supercite" "Supercite 3.1" t)
;(add-hook 'mail-citation-hook 'sc-cite-original)
(setq news-reply-header-hook nil)
(add-hook 'mail-citation-hooks 'sc-cite-original)
(setq sc-citation-leader "")

(setq calendar-longitude -122)
(setq calendar-latitude 37.4)

;; Make searches be case-sensitive.
(setq-default case-fold-search nil)
; Highlight current hit during search.
(setq search-highlight t)
;; an isearch-mode-hook (from chuck), toggles case-sensitivity
(add-hook 'isearch-mode-hook
	  (lambda ()
	    (define-key isearch-mode-map "\C-t" 'isearch-toggle-case-fold)
	    ))

;; Did this change in emacs21?  Defaulting bsd used to be enough.
(setq c-basic-offset 4)
(setq c-default-style "bsd")

; maybe I'll do this in file-local lists.
(setq  asm-comment-char ?\!)

;;(if (file-exists-p "/local/0/jerry/src/emacs-20.7/info/dir")
;;    (setq Info-default-directory-list
;;	  (append '("/local/0/jerry/src/emacs-20.7/info")
;;		  Info-default-directory-list)))

(setq Info-default-directory-list 
      (cons "/usr/local/emacs/info" Info-default-directory-list))

;; (if (file-exists-p "~jerry/emacs/info/dir")
;;     (setq Info-default-directory-list
;; 	  (append Info-default-directory-list '("~jerry/emacs/info"))))

;; pick this up where I might have installed it.
(if (file-exists-p "/local/0/jerry/src/emacs-20.7/etc/spook.lines")
    (setq spook-phrases-file "/local/0/jerry/src/emacs-20.7/etc/spook.lines"))

15.2 Dino

;; I don't want a menu bar or scroll bar.
;;
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;
;; Default load-paths
;;
(setq load-path (append load-path (list "~dino/emacs")))
(setq load-path (append load-path (list "/usr/share/emacs/site-lisp")))
(setq load-path (append load-path (list "/usr/share/emacs/20.3/lisp")))
(setq load-path (append load-path (list "/tools/pkgs/gnats/default/share/emacs/lisp")))

;;
;; C-mode modifications
;;
;;(setq c-mode-common-hook '(lambda ()
;;                          (auto-fill-mode 1)
;;                          (c-set-style "whitesmith")))
;;                          (setq comment-column 40)))

(setq c-mode-hook '(lambda () 
    (setq c-auto-newline nil)
    (setq blink-matching-paren nil)
    (setq c-continued-statement-offset 4)
    (setq c-tab-always-indent nil)
    (setq c-basic-offset 4)
    (setq c-indent-level 4)
    (setq c-argdecl-indent 4)
    (setq indent-tabs-mode nil)
    (setq c-label-offset -4)))
(setq tab-width 4)

;;
;; Allow eval-expression (default binding on ESC ESC)
;;      Evaluate EXPRESSION and print value in minibuffer.
;;      Value is also consed on to front of variable  values  's value.
;;
(put 'eval-expression 'disabled nil)

;;
;; allow narrow-to-region (default binding on C-x n)
;;      Restrict editing in this buffer to the current region.
;;      The rest of the text becomes temporarily invisible and untouchable
;;      but is not deleted; if you save the buffer in a file, the invisible
;;      text is included in the file.  C-x w makes all visible again.
;;      
;;      When calling from a program, pass two arguments; character numbers
;;      bounding the text that should remain visible.
;;
(put 'narrow-to-region 'disabled nil)

;;;;; start "modeline configuration setup"
;;
;; Load a version of time which allows reminders to be put into the
;; modeline.
;;
(display-time)

;;
;; Preferences: set up auto indented mode similary to autosave mode.
;;
;;(load "auto-fill" t t nil)

;;
;; Miscellaneous useful functions
;;
(autoload 'compress-buffer "compress-buffer"
  "Kills trailing whitespace and tabifies." t)

(autoload 'auto-indent-mode "auto-indent" "\
Enable, disable, or toggle auto-indent mode if ARG is nonzero, zero, or
omitted.  Auto-indent mode works by invoking indent-relative for TAB,
and using indent-relative-may as the indent-line-function for auto-fill,
and NEWLINE.")

(autoload 'align-equals "align-eq"
  "make the first assignment operator on each line line up vertically" t)

(setq line-number-mode t)

;;
;; Dired mode hooks
;;
;; DIRED modifications
(load "~/emacs/dired-mode-hook" t t)
(if (fboundp 'dired-mode-hook)
    (setq dired-mode-hook 'dired-mode-hook))

(if (string= (user-login-name) "dino")
    (setq user-telephone-number
          "(415) 688-4696 (Office)"))

;;
;; Modify the next-line function to not add lots of blank lines to the
;; end of the file.
;;
(load "next-line-noextend" t t)

;;
;; Replace the standard open-line with one that inserts the fill-prefix
;;
(load "open-line" t t)

;;
;;
;; Mode default setup
;;
(setq default-major-mode   ;; 'fundamental-mode 
      'indented-text-mode) ;;  I prefer my lines indented -- lrs

;;
;; How often should an auto-save be performed
;;
(setq auto-save-interval 1000)

;;
;; *Regexp describing the end of a sentence.
;; All paragraph boundaries also end sentences, regardless.")
(defconst sentence-end (purecopy "[.?!][]\"')}]*\\([ \t]*$\\|\t\\|  \\)[ \t\n]*") "\
*Regexp describing the end of a sentence.
All paragraph boundaries also end sentences, regardless.")

(defun dino-mail-setup-hook ()
  "My function to run as a mail-setup-hook."
  (if (and (not (featurep 'sc-oloads))
           (load "sc-oloads" t t nil)
           (fboundp 'sc-overload-functions))
      (sc-overload-functions)))

;; Supercite

(autoload 'sc-overload-functions "sc-oloads" "Supercite 2.2 overloads" t)
(autoload 'sc-cite-original "sc" "Supercite 2.2" t)
(setq
 sc-load-hook '(lambda ()
                 (setq
                  sc-citation-leader "" ; string first part of cite
                  sc-electric-references-p nil
                  sc-reference-tag-string ""
                  sc-downcase-p t
                  sc-nuke-mail-headers-p t
                  sc-fixup-whitespace-p nil
                  ))
)

(if (fboundp 'add-hook)
    (progn
      (add-hook 'mail-setup-hook 'dino-mail-setup-hook)
      (add-hook 'mail-yank-hooks 'sc-cite-original))
  (setq mail-setup-hook '(dino-mail-setup-hook)
        mail-yank-hooks 'sc-cite-original))

(setq
 mail-yank-ignored-headers
 (concat
  "^via:\\|^origin:\\|^status:\\|^received:\\|^remailed\\|"
  "^[a-z-]*message-id:\\|^\\(summary-\\)?line[s]?:\\|^cc:\\|"
  "^subject:\\|^\\(\\(in-\\)?reply-\\)?to:\\|^sender:\\|^replied:\\|"
  "^\\(\\(return\\|reply\\)-\\)?path:\\|^\\(posted-\\)?date:\\|"
  "^\\(mail-\\)?from:\\|^newsgroup[s]?:\\|^organization:\\|"
  "^keywords:\\|^distribution:\\|^xref:\\|^references:\\|^x-mailer:\\|"
  "^\\(x-\\)?followup-to:\\|^x-vm-attributes:\\|^expires:\\|"
  "^approved:\\|^apparently-to:\\|^summary:\\|^errors-to:\\|"
  "^mime-version:\\|^content-\\|"
  "^X400\\|^x-vm-attributes:\\|^x-vm-v[0-9]+-data:\\|^phone\\|^x-received:")
 )

;;
;; My keymaps.
;;
(global-set-key "\C-x," 'compile)
(global-set-key "\C-xh" 'help)
(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-c\C-r" 'replace-regexp)
(global-set-key "\eS" 're-search-backward)
(global-set-key "\es" 're-search-forward)
(global-set-key "\eP" 'print-buffer)
(global-set-key "\C-c\C-f" 'insert-file-name-with-completion)
(global-set-key "\C-cb" 'dash-line-break)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-ci" 'indent-reply)
(global-set-key "\C-cs" 'dired-sort-toggle-or-edit)
(global-set-key "\C-cl" 'what-line)
(global-set-key "\C-co" 'occur)
(global-set-key "\C-ce" 'next-error)
(global-set-key "\C-cm" 'set-mark-command)
(global-set-key "\C-cv" 'visit-tags-table)
(global-set-key "\eo" 'overwrite-mode)
(global-set-key "\C-cw" 'compare-windows)
(global-set-key "\C-c64" 'base64)

;;
;; Fix operation of the DEL key in overwrite-mode.
;;
(if (fboundp 'backward-del-char-untab-insert-spc)
    (global-set-key "\C-?" 'backward-del-char-untab-insert-spc)
  (if (fboundp 'backward-delete-char-untabify)
      (global-set-key "\C-?" 'backward-delete-char-untabify)))

;;
;; Spelling stuff.
;;
(setq ispell-program-name "ispell-3.1.03")
(autoload 'ispell-word "ispell"             
          "Check the spelling of word in buffer." t)
(autoload 'ispell-region "ispell"
          "Check the spelling of region." t)        
(autoload 'ispell-buffer "ispell"
          "Check the spelling of buffer." t)
(if (fboundp 'ispell-complete-word)
    (global-set-key "\e " 'ispell-complete-word))

;;
;; Insert a box contining the prompted characters for each line of the
;; region.
;;
(load "~dino/emacs/site-common.elc" t t nil)
(autoload 'insert-box "insert-box"
          "Insert box with specified character." t)
(if (fboundp 'insert-box)
    (global-set-key "\C-cp" 'insert-box))

;;
;; find-this-file
;;
;(load "~/emacs/find-this-file.el" t t nil)
(autoload 'find-this-file "find-this-file" 
          "Find file with file name that pointer is on." t)
(if (fboundp 'find-this-file)
    (global-set-key "\C-cf" 'find-this-file))

;;
;; Reading external news.
;;
(autoload 'gnus "gnus" "Gnu News reader." t)
(defun world-news () "Read news from the net"
  (interactive)
  (setq gnus-nntp-server "news.csl.sri.com")
  (gnus)
)
(defun procket-news () "Read news from the net"
  (interactive)
  (setq gnus-nntp-server "news.procket.com")
  (gnus)
)

;;
;; Autoload webster dictionary.
;;
(autoload 'webster "webster" 
          "Look up word in Webster's Dictionary." t)

;;
;; Indent with ">> " for replying to email.
;;
(defun indent-reply ()
  "Indent a paragraph in a buffer to the e-mail buffer"
  (interactive)
  (save-excursion
    (backward-paragraph)
    (forward-line 1)
    (let ((start (point)))
      (forward-paragraph)
      (copy-region-as-kill start (point))
      (other-window 1)
      (end-of-buffer)
      (beginning-of-line)
      (yank)
      (insert-box (mark) (point) ">> ")
      (newline)
      (insert "    "))))

;;
;; Run GID for symbol cursor is on.
;;
(global-set-key "\M-\r" 'gid)
(defun gid (command)
  "Run gid, with user-specified args, and collect output in a buffer.
While gid runs asynchronously, you can use the \\[next-error] command
to find the text that gid hits refer to.  Gid is Greg Mcgary's
pre-digested-grep program, like ctags, but for grep."
  (interactive (list (read-input "Run gid (with args): "
                                 (symbol-around-point))))
  (require 'compile)
  (compile-internal (concat "gid " command)
                "No more gid hits" "gid" nil grep-regexp-alist))
;;  (compile1 (concat "gid " command) "No more gid hits" "gid"))

(defun symbol-around-point ()
  "Return the symbol around the point as a string."
  (save-excursion
    (if (not (looking-at "\\s_\\|\\sw")) ; if not in a symbol
        (re-search-backward "\\s_\\|\\sw" nil t)) ; go into prev. one
    (buffer-substring
      (progn (forward-sexp 1) (point))
      (progn (backward-sexp 1) (point)))))

;;
;; Put dots in NSAP address
;;
(fset 'dot-nsap
   "..........")

;;
;; Getting mail accelerator
;;
(fset 'get-mail
g")"bRMAIL
(global-set-key "\M-m" 'get-mail)

;;
;; smiley face that is captured for subsequent C-y's
;;
(fset 'smiley
   ":-) ")
(fset 'sadey
   ":-( ")
(fset 'jokey
   ";-) ")

;;
;; Emphasize header fields in different fonts via mh-show-mode-hook
;; from mdb
(defvar my-mh-keywords
   '(("^From: \\(.*\\)" 1 'bold t)
     ("^Subject: \\(.*\\)" 1 'highlight t))
  "mh-e additions for font-lock-keywords.")
(defun my-mh-show-mode-hook ()
  "Hook to turn on and customize fonts."
  (require 'font-lock)                 ; for font-lock-keywords below
  (make-local-variable 'font-lock-mode-hook) ; don't affect other buffers
  (add-hook 'font-lock-mode-hook       ; set a hook with inline function
            (function                  ; modifies font-lock-keywords when
             (lambda ()                ; font-lock-mode run
               (setq font-lock-keywords
                     (append my-mh-keywords font-lock-keywords)))))
  (font-lock-mode 1))                  ; change the typefaces

(if window-system                      ; can't do this on ASCII terminal
    (add-hook 'mh-show-mode-hook 'my-mh-show-mode-hook))

;;
;; Set fill column to column 80 always.
;;
(set-fill-column 80)

(put 'set-goal-column 'disabled nil)

;;
;; Mailcrypt for PGP stuff
;;
(load "~/emacs/mailcrypt.elc" t t)
(autoload 'mc-install-write-mode "mailcrypt" nil t)
(autoload 'mc-install-read-mode "mailcrypt" nil t)
(add-hook 'mail-mode-hook 'mc-install-write-mode)
(add-hook 'rmail-mode-hook 'mc-install-read-mode)
(add-hook 'rmail-summary-mode-hook 'mc-install-read-mode)

;;
;; Key server at MIT (Massachusetts, USA)
;;
;; This is the default; these lines are only for reference
;;
(setq mc-pgp-keyserver-address "pgp.ai.mit.edu")
;;(setq mc-pgp-keyserver-address "pgp.cisco.com")
(setq mc-pgp-keyserver-port 80)
;;(setq mc-pgp-keyserver-url-template
;;      "/htbin/pks-extract-key.pl?op=get&search=%s")
;;(put 'downcase-region 'disabled nil)
;;(autoload 'mc-setversion "mailcrypt" "Select PGP version" t)
;;(mc-setversion "5.0") ;; Alternately, "2.6"

;;
;; shell prompt highlighting on font-lock-mode
;;
;;(setq shell-prompt-pattern "*@*% ")

;;
;; Turn on global font-lock if it's available.
;;
(cond ((fboundp 'global-font-lock-mode) (global-font-lock-mode t)))

;;
;; Double the default.  Computers are fast these days, right?
;;
(setq font-lock-maximum-size (* font-lock-maximum-size 2))

;;
;; Start-up macro
;;
(fset 'start
   [escape ?x ?c ?s ?h return ?\C-x ?k ?* ?s ?c tab return])
(csh)
(kill-buffer "*scratch*")

;;
;; Put 72 bytes of "-" for a seperation break.
;;
(fset 'dash-line-break
   [?\C-u ?7 ?9 ?- return])

;;
;; Set C-h to DEL character
;;
(global-set-key "\C-h" 'backward-delete-char-untabify)

;;
;; Macro to insert my PGP public key in email messages.
;;
(fset 'insert-pgp-key
   "\C-xi.pgp/dino.pgp\C-m")
(global-set-key "\C-ck" 'insert-pgp-key)

;;
;; Set default font. I use this because the Exceed X server and emacs 20
;; use large sizes when not doing 7x13.
;;
(fset 'myfont
   [escape ?x ?s ?e ?t ?- ?d ?e ?f tab return ?7 ?x ?1 ?3 return])

;; 
;; Insert C function format.
;;
(fset 'insert-function
   [return return ?/ ?* return tab delete ?* ?  ?x ?x ?x ?x ?x return tab ?* return tab ?* ?  ?C ?o
 ?m ?m ?e ?n ?t ?s ?. return tab ?* ?/ return ?v ?o ?i ?d ?  ?x ?x ?x ?x ?x ?  ?v backspace ?( ?v ?
o ?i ?d ?) return ?{ return ?}])
(global-set-key "\M-i" 'insert-function)

;;
;; gnats macros.
;;
(fset 'pr
   "\C-ssubmitter-id:\C-f\C-x\C-n\C-n\C-n\C-nno\C-k\C-n")

;;
;; For converting base64 encoded messages in email. Puts original file type
;; in home directory.
;;
(fset 'base64
   [?\C-s ?f ?i ?l ?e ?n ?a ?m ?e ?= ?" ?\C-  ?\C-s ?" ?\C-b escape ?w ?\C-a ?\C-n ?\C-n ?\C-  ?\C-
s ?- ?- ?- ?- ?- ?- ?\C-a escape ?x ?w ?r ?  ?r ?e ?g ?  return ?~ ?/ ?f ?o ?o return ?y escape ?! 
?m ?y ?b ?a ?s ?e ?6 ?4 ?  ?\C-y return])



15.3 Rex

;; I don't want a menu bar or scroll bar.
;;
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;
;; Default load-paths
;;
(setq load-path (append load-path (list "~rex/emacs")))
(setq load-path (append load-path (list "/usr/share/emacs/site-lisp")))
(setq load-path (append load-path (list "/usr/share/emacs/20.3/lisp")))
(setq load-path (append load-path (list "/tools/pkgs/gnats/default/share/emacs/lisp")))

;;
;; C-mode modifications
;;
;;(setq c-mode-common-hook '(lambda ()
;;                          (auto-fill-mode 1)
;;                          (c-set-style "whitesmith")))
;;                          (setq comment-column 40)))

(setq c-mode-hook '(lambda () 
    (setq c-auto-newline nil)
    (setq blink-matching-paren nil)
    (setq c-continued-statement-offset 4)
    (setq c-tab-always-indent nil)
    (setq c-basic-offset 4)
    (setq c-indent-level 4)
    (setq c-argdecl-indent 4)
    (setq c-label-offset -4)))
(setq tab-width 4)

 (when (or (string-match "XEmacs\\|Lucid" emacs-version) window-system)
    (require 'mic-paren) ; loading
    (paren-activate)     ; activating
)

;;
;; Commands for scrolling
;;

;; alias to less confusing names
(defalias 'scroll-ahead 'scroll-up) ;; text scrolls up, we move ahead
(defalias 'scroll-behind 'scroll-down)

;;
;; Send n lines of the text scrolling up. Change the position of
;; the cursor in the _buffer_ only if we have to.
;;
(defun scroll-n-lines-ahead (&optional n)
  "Scroll ahead N lines (1 by default)."
  (interactive "P")
  (scroll-ahead (prefix-numeric-value n)))

;;
;; Send n lines of text scrolling down. Change the position of
;; the cursor in the _buffer_ only if we have to.
;;
(defun scroll-n-lines-behind (&optional n)
  "Scroll behind N lines (1 by default)."
  (interactive "P")
  (scroll-behind (prefix-numeric-value n)))

;;
;; View the next n lines (default 1) of the buffer, while maintaining
;; the location of the cursor in the _window_.
;;
(defun scroll-move-n-lines-ahead (&optional n)
  "Move ahead while maintaing cursor location in window"
  (interactive "P")
  (scroll-ahead (prefix-numeric-value n))
  (next-line (prefix-numeric-value n)))

;;
;; View the previous n lines (default 1) of the buffer, while
;; maintaining the location of the cursor in the _window_.
;;
(defun scroll-move-n-lines-behind (&optional n)
  "Move behind while maintaining cursor location in window"
  (interactive "P")
  (scroll-behind (prefix-numeric-value n))
  (previous-line (prefix-numeric-value n)))

(global-set-key "\C-q" 'scroll-n-lines-ahead)
(global-set-key "\C-z" 'scroll-n-lines-behind)




;;
;; Allow eval-expression (default binding on ESC ESC)
;;      Evaluate EXPRESSION and print value in minibuffer.
;;      Value is also consed on to front of variable  values  's value.
;;
(put 'eval-expression 'disabled nil)

;;
;; allow narrow-to-region (default binding on C-x n)
;;      Restrict editing in this buffer to the current region.
;;      The rest of the text becomes temporarily invisible and untouchable
;;      but is not deleted; if you save the buffer in a file, the invisible
;;      text is included in the file.  C-x w makes all visible again.
;;      
;;      When calling from a program, pass two arguments; character numbers
;;      bounding the text that should remain visible.
;;
(put 'narrow-to-region 'disabled nil)

;;;;; start "modeline configuration setup"
;;
;; Load a version of time which allows reminders to be put into the
;; modeline.
;;
(display-time)

;;
;; Preferences: set up auto indented mode similary to autosave mode.
;;
;;(load "auto-fill" t t nil)

;;
;; Miscellaneous useful functions
;;
(autoload 'compress-buffer "compress-buffer"
  "Kills trailing whitespace and tabifies." t)

(autoload 'auto-indent-mode "auto-indent" "\
Enable, disable, or toggle auto-indent mode if ARG is nonzero, zero, or
omitted.  Auto-indent mode works by invoking indent-relative for TAB,
and using indent-relative-may as the indent-line-function for auto-fill,
and NEWLINE.")

(autoload 'align-equals "align-eq"
  "make the first assignment operator on each line line up vertically" t)

(setq line-number-mode t)

;;
;; Dired mode hooks
;;
;; DIRED modifications
(load "~/emacs/dired-mode-hook" t t)
(if (fboundp 'dired-mode-hook)
    (setq dired-mode-hook 'dired-mode-hook))

(if (string= (user-login-name) "rex")
    (setq user-telephone-number
          "(415) 688-4696 (Office)"))

;;
;; Modify the next-line function to not add lots of blank lines to the
;; end of the file.
;;
(load "next-line-noextend" t t)

;;
;; Replace the standard open-line with one that inserts the fill-prefix
;;
(load "open-line" t t)

;;
;;
;; Mode default setup
;;
(setq default-major-mode   ;; 'fundamental-mode 
      'indented-text-mode) ;;  I prefer my lines indented -- lrs

;;
;; How often should an auto-save be performed
;;
(setq auto-save-interval 1000)

;;
;; *Regexp describing the end of a sentence.
;; All paragraph boundaries also end sentences, regardless.")
(defconst sentence-end (purecopy "[.?!][]\"')}]*\\([ \t]*$\\|\t\\|  \\)[ \t\n]*") "\
*Regexp describing the end of a sentence.
All paragraph boundaries also end sentences, regardless.")

(defun rex-mail-setup-hook ()
  "My function to run as a mail-setup-hook."
  (if (and (not (featurep 'sc-oloads))
           (load "sc-oloads" t t nil)
           (fboundp 'sc-overload-functions))
      (sc-overload-functions)))

;; Supercite

(autoload 'sc-overload-functions "sc-oloads" "Supercite 2.2 overloads" t)
(autoload 'sc-cite-original "sc" "Supercite 2.2" t)
(setq
 sc-load-hook '(lambda ()
                 (setq
                  sc-citation-leader "" ; string first part of cite
                  sc-electric-references-p nil
                  sc-reference-tag-string ""
                  sc-downcase-p t
                  sc-nuke-mail-headers-p t
                  sc-fixup-whitespace-p nil
                  ))
)

(if (fboundp 'add-hook)
    (progn
      (add-hook 'mail-setup-hook 'rex-mail-setup-hook)
      (add-hook 'mail-yank-hooks 'sc-cite-original))
  (setq mail-setup-hook '(rex-mail-setup-hook)
        mail-yank-hooks 'sc-cite-original))

(setq
 mail-yank-ignored-headers
 (concat
  "^via:\\|^origin:\\|^status:\\|^received:\\|^remailed\\|"
  "^[a-z-]*message-id:\\|^\\(summary-\\)?line[s]?:\\|^cc:\\|"
  "^subject:\\|^\\(\\(in-\\)?reply-\\)?to:\\|^sender:\\|^replied:\\|"
  "^\\(\\(return\\|reply\\)-\\)?path:\\|^\\(posted-\\)?date:\\|"
  "^\\(mail-\\)?from:\\|^newsgroup[s]?:\\|^organization:\\|"
  "^keywords:\\|^distribution:\\|^xref:\\|^references:\\|^x-mailer:\\|"
  "^\\(x-\\)?followup-to:\\|^x-vm-attributes:\\|^expires:\\|"
  "^approved:\\|^apparently-to:\\|^summary:\\|^errors-to:\\|"
  "^mime-version:\\|^content-\\|"
  "^X400\\|^x-vm-attributes:\\|^x-vm-v[0-9]+-data:\\|^phone\\|^x-received:")
 )

;;
;; My keymaps.
;;
(global-set-key "\C-x," 'compile)
(global-set-key "\C-xh" 'help)
(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-c\C-r" 'replace-regexp)
(global-set-key "\eS" 're-search-backward)
(global-set-key "\es" 're-search-forward)
(global-set-key "\eP" 'print-buffer)
(global-set-key "\C-c\C-f" 'insert-file-name-with-completion)
(global-set-key "\C-cb" 'dash-line-break)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-ci" 'indent-reply)
(global-set-key "\C-cs" 'dired-sort-toggle-or-edit)
(global-set-key "\C-cl" 'what-line)
(global-set-key "\C-co" 'occur)
(global-set-key "\C-ce" 'next-error)
(global-set-key "\C-cm" 'set-mark-command)
(global-set-key "\C-cv" 'visit-tags-table)
(global-set-key "\eo" 'overwrite-mode)
(global-set-key "\C-cw" 'compare-windows)

;;
;; Fix operation of the DEL key in overwrite-mode.
;;
(if (fboundp 'backward-del-char-untab-insert-spc)
    (global-set-key "\C-?" 'backward-del-char-untab-insert-spc)
  (if (fboundp 'backward-delete-char-untabify)
      (global-set-key "\C-?" 'backward-delete-char-untabify)))

;;
;; Spelling stuff.
;;
(setq ispell-program-name "ispell-3.1.03")
(autoload 'ispell-word "ispell"             
          "Check the spelling of word in buffer." t)
(autoload 'ispell-region "ispell"
          "Check the spelling of region." t)        
(autoload 'ispell-buffer "ispell"
          "Check the spelling of buffer." t)
(if (fboundp 'ispell-complete-word)
    (global-set-key "\e " 'ispell-complete-word))

;;
;; Insert a box contining the prompted characters for each line of the
;; region.
;;
(load "~rex/emacs/site-common.elc" t t nil)
(autoload 'insert-box "insert-box"
          "Insert box with specified character." t)
(if (fboundp 'insert-box)
    (global-set-key "\C-cp" 'insert-box))

;;
;; find-this-file
;;
;(load "~/emacs/find-this-file.el" t t nil)
(autoload 'find-this-file "find-this-file" 
          "Find file with file name that pointer is on." t)
(if (fboundp 'find-this-file)
    (global-set-key "\C-cf" 'find-this-file))

;;
;; Load GNUs.
;;
(autoload 'gnus "gnus" "Gnu News reader." t)
;;(if (fboundp 'gnus)
;;    (setq gnus-nntp-server "news.cisco.com"))

;;
;; Reading external news.
;;
(defun world-news () "Read news from the net"
  (interactive)
  (setq gnus-nntp-server "news.csl.sri.com")
  (gnus)
)

;;
;; Autoload webster dictionary.
;;
(autoload 'webster "webster" 
          "Look up word in Webster's Dictionary." t)

;;
;; Indent with ">> " for replying to email.
;;
(defun indent-reply ()
  "Indent a paragraph in a buffer to the e-mail buffer"
  (interactive)
  (save-excursion
    (backward-paragraph)
    (forward-line 1)
    (let ((start (point)))
      (forward-paragraph)
      (copy-region-as-kill start (point))
      (other-window 1)
      (end-of-buffer)
      (beginning-of-line)
      (yank)
      (insert-box (mark) (point) ">> ")
      (newline)
      (insert "    "))))

;;
;; Run GID for symbol cursor is on.
;;
(global-set-key "\M-\r" 'gid)
(defun gid (command)
  "Run gid, with user-specified args, and collect output in a buffer.
While gid runs asynchronously, you can use the \\[next-error] command
to find the text that gid hits refer to.  Gid is Greg Mcgary's
pre-digested-grep program, like ctags, but for grep."
  (interactive (list (read-input "Run gid (with args): "
                                 (symbol-around-point))))
  (require 'compile)
  (compile-internal (concat "gid " command)
                "No more gid hits" "gid" nil grep-regexp-alist))
;;  (compile1 (concat "gid " command) "No more gid hits" "gid"))

(defun symbol-around-point ()
  "Return the symbol around the point as a string."
  (save-excursion
    (if (not (looking-at "\\s_\\|\\sw")) ; if not in a symbol
        (re-search-backward "\\s_\\|\\sw" nil t)) ; go into prev. one
    (buffer-substring
      (progn (forward-sexp 1) (point))
      (progn (backward-sexp 1) (point)))))

;;
;; Put dots in NSAP address
;;
(fset 'dot-nsap
   "..........")

;;
;; Getting mail accelerator
;;
(fset 'get-mail
g")"bRMAIL
(global-set-key "\M-m" 'get-mail)

;;
;; smiley face that is captured for subsequent C-y's
;;
(fset 'smiley
   ":-) ")
(fset 'sadey
   ":-( ")
(fset 'jokey
   ";-) ")

;;
;; Emphasize header fields in different fonts via mh-show-mode-hook
;; from mdb
(defvar my-mh-keywords
   '(("^From: \\(.*\\)" 1 'bold t)
     ("^Subject: \\(.*\\)" 1 'highlight t))
  "mh-e additions for font-lock-keywords.")
(defun my-mh-show-mode-hook ()
  "Hook to turn on and customize fonts."
  (require 'font-lock)                 ; for font-lock-keywords below
  (make-local-variable 'font-lock-mode-hook) ; don't affect other buffers
  (add-hook 'font-lock-mode-hook       ; set a hook with inline function
            (function                  ; modifies font-lock-keywords when
             (lambda ()                ; font-lock-mode run
               (setq font-lock-keywords
                     (append my-mh-keywords font-lock-keywords)))))
  (font-lock-mode 1))                  ; change the typefaces

(if window-system                      ; can't do this on ASCII terminal
    (add-hook 'mh-show-mode-hook 'my-mh-show-mode-hook))

;;
;; Set fill column to column 80 always.
;;
(set-fill-column 80)

(put 'set-goal-column 'disabled nil)

;;
;; Mailcrypt for PGP stuff
;;
(load "~/emacs/mailcrypt.elc" t t)
(autoload 'mc-install-write-mode "mailcrypt" nil t)
(autoload 'mc-install-read-mode "mailcrypt" nil t)
(add-hook 'mail-mode-hook 'mc-install-write-mode)
(add-hook 'rmail-mode-hook 'mc-install-read-mode)
(add-hook 'rmail-summary-mode-hook 'mc-install-read-mode)

;;
;; Key server at MIT (Massachusetts, USA)
;;
;; This is the default; these lines are only for reference
;;
(setq mc-pgp-keyserver-address "pgp.ai.mit.edu")
;;(setq mc-pgp-keyserver-address "pgp.cisco.com")
(setq mc-pgp-keyserver-port 80)
(setq mc-pgp-keyserver-url-template
      "/htbin/pks-extract-key.pl?op=get&search=%s")
(put 'downcase-region 'disabled nil)
(autoload 'mc-setversion "mailcrypt" "Select PGP version" t)
(mc-setversion "5.0") ;; Alternately, "2.6"

;;
;; Start-up macro
;;
(fset 'start
   [escape ?x ?c ?s ?h return ?\C-x ?k ?* ?s ?c tab return])
(csh)
(kill-buffer "*scratch*")

;;
;; Put 72 bytes of "-" for a seperation break.
;;
(fset 'dash-line-break
   [?\C-u ?7 ?2 ?- return])

;;
;; Set C-h to DEL character
;;
(global-set-key "\C-h" 'backward-delete-char-untabify)

;;
;; Macro to insert my PGP public key in email messages.
;;
(fset 'insert-pgp-key
   "\C-xi.pgp/rex.pgp\C-m")
(global-set-key "\C-ck" 'insert-pgp-key)

;;
;; Set default font. I use this because the Exceed X server and emacs 20
;; use large sizes when not doing 7x13.
;;
(fset 'myfont
   [escape ?x ?s ?e ?t ?- ?d ?e ?f tab return ?7 ?x ?1 ?3 return])

;; 
;; Insert C function format.
;;
(fset 'insert-function
   [return return ?/ ?* return tab delete ?* ?  ?x ?x ?x ?x ?x return tab ?* return tab ?* ?  ?C ?o
 ?m ?m ?e ?n ?t ?s ?. return tab ?* ?/ return ?v ?o ?i ?d ?  ?x ?x ?x ?x ?x ?  ?v backspace ?( ?v ?
o ?i ?d ?) return ?{ return ?}])
(global-set-key "\M-i" 'insert-function)


16. References

CVS: http://www.cvshome.org/docs/manual/cvs.html

17. Unresolved Issues


18. VT100 Terminal Settings

Sometimes emacs rejects from remote dumb terminals. 

Try doing a "set term=vt100" (or putting it in your .cshrc) and then
do a "emacs -nw". See if you have better luck. Also setting the row
length might help "stty rows <len>".


19. SMTP Data Encoding Error

Symptom: Saved a FrameMaker file in text format with ANSI (Windows)
encoding (the default). Then, opened that file in emacs and imported
it into a new Rmail buffer. Got the follow SMTP error message in the
trace buffer (reported by the commands "setq smtpmail-debug-info" and
"setq smtpmail-debug-verb" in .emacs) upon sending the message:

  Error: improper use of 8-bit data in message body

And the following notification appeared in the Warning buffer that
also popped up:

    These default coding systems were tried:
      iso-latin-1
    However, none of them safely encodes the target text.

    Select one of the following safe coding systems:
      utf-8 mule-utf-16-le mule-utf-16-be koi8-r raw-text emacs-mule
      no-conversion

Solution: Windoze Rmail uses utf-8 encoding by default. Changing the other
encoding schemes didn't fix anything. Had to go back to FrameMaker and
resave the text file using ASCII encoding. That fixed it! :-
)
