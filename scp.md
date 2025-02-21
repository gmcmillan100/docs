---
layout: page
title: scp
permalink: /scp/
resource: true
---
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
$ scp _emacs _mailrc clipart_greg.eps frame.txt framemaker-postscript.txt illu
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

# Copy Files from Remote to Local

scp 1 file:

```
$ scp gmcmilla@wus2-wikiprod03:/tmp/greglog-atlassian-confluence.log.3 .

(gmcmilla@wus2-wikiprod03.linkedin.biz) Password: 
greglog-atlassian-confluence.log.3                                                                                                                                                          100%   20MB   5.9MB/s   00:03    
```

scp multiple files (but must enter password once for each file):

```
$ scp gmcmilla@wus2-wikiprod03:/tmp/{greg-atlassian-confluence.log.1,greg-atlassian-confluence.log.2} .
```

scp multiple files using * (enter password only once for all files matching):


```
$ scp gmcmilla@wus2-wikiprod03:/tmp/greg-* .

(gmcmilla@wus2-wikiprod03.linkedin.biz) Password: 
greg-atlassian-confluence.log                                                                                                                                                                                        100%   13MB   4.9MB/s   00:02    
greg-atlassian-confluence.log.1                                                                                                                                                                                      100%   20MB  13.5MB/s   00:01    
greg-atlassian-confluence.log.2                                                                                                                                                                                      100%   20MB  12.0MB/s   00:01    
greg-atlassian-confluence.log.3                                                                                                                                                                                      100%   20MB  14.9MB/s   00:01    
greg-atlassian-confluence.log.4                                                                                                                                                                                      100%   20MB  15.6MB/s   00:01    
greg-atlassian-confluence.log.5                                                                                                                                                                                      100%   20MB  16.1MB/s   00:01  
```


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