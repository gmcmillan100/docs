---
layout: page
title: vi
permalink: /vi/
resource: true
---

# Commands

```
y       copy text row 
p       paste text after curser
$       go to end of line
0       jump to beginning of line
dd      delete line
D       delete from cursor to the end of the line
x       Delete character under the cursor
w!      write file and override (!) anything else
/foo    search (/) forward for a string "foo"
n or /  repeat search forward
N       repeat search backward
G       Go to last line in file
1G	Go to top of file
H       Move to top of screen
M       Move to middle of screen
L       Move to last line of screen
$	go to end of line
CTRL-a  go to beginning of line
CTRL-e  go to end of line
CTRL-f	Scroll forward one screen
CTRL-b  Scroll back one screen
SHIFT-g  Go to end of file
SHIFT-a  Go to end of line and enter insert mode

/<pattern>   Finds a <pattern>

n            Finds the next occurance of <pattern> in the same 
             direction as the most recent /

N            Finds next occurance of <pattern> but in the opposite
             direction as the most recent /

There are 3 ways to quit and save:

        :wq
        :x
        ZZ (no colon)

```

While in vi, you can search backwards by using the question mark (?) command. Simply go to the end of the file (Shift G), enter the "?" command, and enter the string I want to search on (i.e., 1400 for my pixel depth resolution number), then press Return.


Search:

```
*  / pattern   searches for pattern in the text after the cursor
*  ? pattern   searches for pattern in the text before the cursor
*  n           keeps searching in the same direction
*  N           keeps searching in the opposite direction
```

# Delete Lines

To delete lines 13 to 47:

```
vi filename
:set number
:13,47d
```

# Paste Mode with No Autoindent

To turn off autoindent when you paste code, there's a special "paste" mode.

Type this:

```
:set paste
```

Then paste your code (command v). Note that the text in the tooltip now says – INSERT (paste) --.
After you pasted your code, turn off the paste-mode, so that auto-indenting when you type works correctly again.

```
:set nopaste
```

# Yank Copy a Range

If you ever need to cut/copy/delete/paste lines without knowing the actual number of lines, here is what you should do.

1. In normal mode, go to the beginning of the section that you want to yank.
2. Type mk to mark this spot as k.
3. Go to the end of the section you want to yank using whatever movement commands you like.
4. Type: y'k (<y-yank>, <single quote-go to mark>, k) To yank from the mark to the current location.
5. You can paste those lines wherever you want with p

Similarly, d'k will cut/delete the lines from the current location to the mark.

# Text Replacement

Text can be searched/replaced inside vi. For example to remove "^M" (Ctrl-M) characters:

Inside vi [in ESC mode] type: 

```
:%s/^M//g
```
To enter ^M, type CTRL-V, then CTRL-M. That is, hold down the CTRL key then press V and M in succession.

# References

vi manual, http://www.cs.fsu.edu/general/vimanual.html

http://engr.smu.edu/co/help/vi-tips.html
