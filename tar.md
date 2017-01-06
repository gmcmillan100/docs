tar zcf <destination-filename> <source-directory-to-get-files-from>

To untar/unzip, tar zxf <filename>

Meaning of the flags in the "tar" command:

	z = Use gzip
	c = Create a tar file
	f = The next parameter is the name of the tar file

Typically, make the filename that you want to save end with
".tgz". This means it's a tar file that has been gzipped
(compressed).

For quick system backups, tar select directories:

tar zcf backup-criticals.tgz docs/ root/ etc/ source-tgz/ xml/ finances/ employees.org/ resumes/ commands/ 
mv backup-criticals.tgz /ad1s1e-backup


file
----
Use the file command to display the file's type:

$ file rsync-3.0.2.tar.gz 
rsync-3.0.2.tar.gz: GNU tar archive

This file is not a gzip even though the ".gz" is inside the file name.

$ mv rsync-3.0.2.tar.gz rsync-3.0.2.tar
$ tar xvf rsync-3.0.2.tar



solaris
-------

Step 1--Tar cvf a directory then gzip it

[gmcmillan@sund-4-021-78 new-feature-webpages]% tar cvf 23-beta-docs-tar 23beta
a 23beta/ 0K
a 23beta/qos_commands.pdf 165K
a 23beta/qos_config.pdf 74K
a 23beta/qos_overview.pdf 20K
a 23beta/show-lacp-aggregator.pdf 18K
...
[gmcmillan@sund-4-021-78 new-feature-webpages]% ll 23-beta-docs-tar
-rw-r--r--   1 gmcmilla pubs      1314816 Oct  3 11:49 23-beta-docs-tar
[gmcmillan@sund-4-021-78 new-feature-webpages]% gzip 23-beta-docs-tar


Step 2--Ungzip then tar xvf

[gmcmillan@sund-4-021-78 ~/trash]% gunzip 23-beta-docs.tgz
[gmcmillan@sund-4-021-78 ~/trash]% ls
23-beta-docs.tar
[gmcmillan@sund-4-021-78 ~/trash]% tar xvf 23-beta-docs.tar
x 23beta, 0 bytes, 0 tape blocks
x 23beta/qos_commands.pdf, 168953 bytes, 330 tape blocks
x 23beta/qos_config.pdf, 74876 bytes, 147 tape blocks
x 23beta/qos_overview.pdf, 19579 bytes, 39 tape blocks
x 23beta/show-lacp-aggregator.pdf, 18238 bytes, 36 tape blocks


