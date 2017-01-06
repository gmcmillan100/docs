
        vi commands
        ------------

y       copy text row 
p       paste text after curser
$       go to end of line
0       jump to beginning of line
dd      delete line
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
CTRL-f  Scroll forward one screen
CTRL-b  Scroll back one screen

There are 3 ways to quit and save:

        :wq
        :x
        ZZ (no colon)


vi manual, http://www.cs.fsu.edu/general/vimanual.html

While in vi, I can search backwards by using the question mark (?)
command. Simply go to the end of the file (Shift G), enter the "?"
command, and enter the string I want to search on (i.e., 1400 for my
pixel depth resolution number), then press Return.


Search:

    *  / pattern   searches for pattern in the text after the cursor
    *  ? pattern   searches for pattern in the text before the cursor
    *  n           keeps searching in the same direction
    *  N           keeps searching in the opposite direction


Text Replacement
----------------
Text can be searched/replaced inside vi. For example to remove "^M" (Ctrl-M) characters:

Inside vi [in ESC mode] type: :%s/^M//g
To enter ^M, type CTRL-V, then CTRL-M. That is, hold down the CTRL key then press V and M in succession.


http://engr.smu.edu/co/help/vi-tips.html
