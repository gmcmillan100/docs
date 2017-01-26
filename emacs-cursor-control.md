---
layout: page
title: Emacs Cursor Control
permalink: /emacscontrol/
resource: true
---

	C-s	Incremental search forward (isearch-forward)
		Type another C-s to move to the next occurrence of the search string. 
	C-r 	Incremental search backward (isearch-backward)
	RET	Stops the search.
	DEL	Cancels the last character of search string.

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

	C-l	Clear screen and redisplay all the text,
		 moving the text around the cursor
		 to the center of the screen.
		 (That's control-L, not control-1.)

        C-h c <command>	   Display a brief explanation of the online documentation
        C-h k <command>	   Display a full explanation of the online documentation

	C-x u	Undo

	<Delete>     delete the character just before the cursor
	C-d   	     delete the next character after the cursor

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



Bulk Delete Same Author in Folder
----------------------------------
1. Shift m + a (mark all messages in current folder by the same author)
2. Shift m + n (prefix my next global command with vm-next-command-uses-marks)
3. d (applies the delete function to all the marked messages)


Bulk Delete all in Folder
-------------------------
1. Shift m + m (mark all messages in current folder)
2. Shift m + n (prefix my next global command with vm-next-command-uses-marks)
3. d (applies the delete function to all the marked messages)

Tip: To undo marks from all messages, enter Shift m + u. 

     To unmark a specified region in the summary highlight the interesting
     region, then enter Shift m + r to unmark.




Notice the parallel between C-f and C-b on the one hand, and M-f and
M-b on the other hand.  Very often Meta characters are used for
operations related to the units defined by language (words, sentences,
paragraphs), while Control characters operate on basic units that are
independent of what you are editing (characters, lines, etc).

This parallel applies between lines and sentences: C-a and C-e move to
the beginning or end of a line, and M-a and M-e move to the beginning
or end of a sentence.


Two other important cursor motion commands are M-< (Meta Less-than),
which moves to the beginning of the whole text, and M-> (Meta
Greater-than), which moves to the end of the whole text.

