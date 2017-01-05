
SCP document
http://www.freebsddiary.org/scp.php

To copy file "rsync" to a remote system called "remotebox" via user "mark". Don't forget the ":"

$ scp rsync-3.0.2.tar.gz greg@192.168.1.101:/usr/home/greg/packages
Passwod:r
rsync-3.0.2.tar.gz                                                                                                          100% 2960KB   1.5MB/s   00:02    

remotebox is the IP address or hostname of the remote box. 

copy a file to a remote system:
scp a remotebox: 

copy a file to a remote system, and put it somewhere other than your home directory:
scp a remotebox:/var/tmp 

That will copy a from your current working directory to /var/tmp on the remote box. 


bsd1 /home/backup/fdry-files> scp _emacs _mailrc clipart_greg.eps frame.txt framemaker-postscript.txt illu
strator rmailsetup webworks.txt mcmillan@192.83.249.36:/export/homed/mcmillan/docs/fdry-files
Password:
_emacs               100% |*******************************************************|  3905       00:00    
_mailrc              100% |*******************************************************|  2921       00:00    
clipart_greg.eps     100% |*******************************************************|  5410 KB    02:14    
frame.txt            100% |*******************************************************|  4117       00:00    
framemaker-postscrip 100% |*******************************************************|  3019       00:00    
illustrator          100% |*******************************************************| 11685       00:00    
rmailsetup           100% |*******************************************************|  4055       00:00    
webworks.txt         100% |*******************************************************|  6786       00:00    
bsd1 /home/backup/fdry-files> 




copy a file to a remote system but a different user id:
scp a mark@remotebox: 


copy file from a remote system:
scp remotebox:a . 

bsd1 /home/backup> scp mcmillan@192.83.249.36:address-book.txt .
Password:
address-book.txt     100% |*****************************| 82485       00:00 

copy file from a remote system, different login:
scp mark@remotebox:a . 

copy recursively from a remote system, different login:
scp -r mark@remotebox:a . 

copy a number of files from a remote system to a specified directory locally:
scp remotebox:\{a,b,c\} ~/my/secret/dir 

pattern matching can be performed with a star '*' if you first escape it with a backslash '\':

scp remote_host:\*.gz .

or 

scp remove_host:mail/example\*folder

You can also enclose them in single quotes

scp 'remotehost:*.gz' .

