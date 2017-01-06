# Copy File To Remote

To copy local file "rsync-3.0.2.tar.gz" to a remote host at "192.168.1.101" via user "greg". Don't forget the ":"

```
$ scp rsync-3.0.2.tar.gz greg@192.168.1.101:/usr/home/greg/packages
Password:
rsync-3.0.2.tar.gz
100% 2960KB   1.5MB/s   00:02
```

Copy many files:

```
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
```

# Copy File from Remote to Local

```
$ scp remotebox:a . 

$ scp mcmillan@192.83.249.36:address-book.txt .
Password:
address-book.txt     100% |*****************************| 82485       00:00 
```

# Copy Using Different Port Number

```
$ scp '-P 10122' spiderDocSource.zip gmc@ssh.spidercloud.com:/home/gmc
```

# Copy Recursively 

```
$ scp -r mark@remotebox:a . 
```

# Pattern Matching

Pattern matching can be performed with a star '*' if you first escape it with a backslash '\':

```
$ scp remote_host:\*.gz .
```

```
$ scp remove_host:mail/example\*folder
```

You can also enclose them in single quotes:

```
$ scp 'remotehost:*.gz' .
```

Copy a number of files from a remote system to a specified directory locally:

```
$ scp remotebox:\{a,b,c\} ~/my/secret/dir 
```

# Resources

http://www.freebsddiary.org/scp.php