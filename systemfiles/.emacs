;Greg's Lisp code for emacs

(server-start)

;(setq load-path (append '("emacs/vm")
;                       load-path))

;--------------------------------------------------------------------------
;nxml

;; Add the nxml files to emacs's search path for loading:
(setq load-path
      (append load-path
              '("/usr/nxml/nxml-mode-20041004/")))

;Automatically load nxml-mode each time I start Emacs. Note that
;rng-auto.el does not load all of the nxml-mode code; it merely sets
;things up so that all the features of nxml-mode will be autoloaded
;properly.

(load "/usr/nxml/nxml-mode-20041004/rng-auto.el")

;Use nxml-mode automatically for files with an extension of xml,
;xsl, rng or xhtml.

(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
            auto-mode-alist))

;completes the tag when you type '</'

(custom-set-variables
'(nxml-slash-auto-complete-flag t))

;---------------------------------------------------------------------------
;vm


(autoload 'vm "vm" "Start VM on your primary inbox." t)
(autoload 'vm-other-frame "vm" "Like `vm' but starts in another frame." t)
(autoload 'vm-visit-folder "vm" "Start VM on an arbitrary folder." t)
(autoload 'vm-visit-virtual-folder "vm" "Visit a VM virtual folder." t)
(autoload 'vm-mode "vm" "Run VM major mode on a buffer" t)
(autoload 'vm-mail "vm" "Send a mail message using VM." t)
(autoload 'vm-submit-bug-report "vm" "Send a bug report about VM." t)

;---------------------------------------------------------------------------
;emacs global

;No scroll bar wanted
(scroll-bar-mode -1)

;Get rid of the darn tool bar
(tool-bar-mode -1)

;; Show the time and load-average in the mode-line.
(display-time)

;Create a keymap that programs "C-h" (occurs when I type <backspace>
; on my
;dumb terminal keyboard) to send a backward delete function.
(global-set-key "\C-h" 'delete-backward-char)

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

;Create a keymap that programs "C-h" (occurs when I type <backspace> on my 
;dumb terminal keyboard) to send a backward delete function. Had to do this to get 
;the backspace key to work from my home-pc.

(global-set-key "\C-h" 'delete-backward-char)

(set-foreground-color "White")
(set-background-color "Black")
(set-cursor-color "Red")
(set-mouse-color "White")

;(set-frame-font "-sony-fixed-medium-r-normal--16-120-100-100-c-80-*-1")

; keyboard macro for inserting an xml comment tag
(fset 'xcomment
   [?< ?! ?- ?- ?  ?  ?- ?- ?> left left left left])
bsd1 /root> 

