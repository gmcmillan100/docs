chmod = Change File Modes

# Owner, group, world

	644 = -rw-r--r-- = owner can read and write, group can read, rest of world can read

	777 = -rwxrwxrwx = all can read, write, and execute

```
$ chmod 644 notes
$ ls -l notes
total 17800
drw-r--r--    4 gmcmilla gmcmilla    16384 Jul 19 15:27 notes
```

# Values

```
Value	Permission				Directory Listing
-----------------------------------------------------------------
 0	No read, no write, no execute		---
 1	No read, no write, execute		--x
 2	No read, write, no execute		-w-
 3	No read, write, execute			-wx
 4	Read, no write, no execute		r--
 5	Read, no write, execute			r-x
 6	Read, write, no execute			rw-
 7	Read, write, execute			rwx
 ```