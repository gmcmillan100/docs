# To do

- rsync without ssh and user account login
- create cron script
- digest http://rsync.samba.org/examples.html
- On WD etc/rsyncd.conf, why is path = /shares/rsync/foo ignored (not working)?. Instead the dest path is specified on the command line.

# Enable rsync daemon on Nassua

1. ssh into the server as root

	```
	ssh root@192.168.1.105
	password: welc0me
	```

2. On the server, create the /etc/rsync.conf and put this in it:

	```
	motd file = /etc/rsyncd.motd                                                    
	log file = /var/log/rsyncd.log                                                  
	pid file = /var/run/rsyncd.pid                                                  
	lock file = /var/run/rsync.lock                                                 
	                                                                                
	[mypath]                                                              
	path = /DataVolume/rsync                                                        
	comment = My Very Own Rsync Server                                              
	uid = nobody                                                                    
	gid = nobody                                                                    
	read only = no                                                                  
	list = yes                                                                      
	auth users = username                                                           
	secrets file = /etc/rsyncd.scrt    
	```       

3. Start the daemon. Must be root.

	```
	rsync --daemon
	```
	```
	more /var/log/rsyncd.log 
	2010/03/18 22:51:51 [15499] rsyncd version 3.0.2 starting, listening on port 873
	```

4.

Create a user account named "rsync" with password "rsync" on the WD. In finder, had to connect to "Nassau" as user "rsync" in order to see sub folders in "rsync" account.

	```
	/usr/bin/rsync
	```

# Running

1. From the client, run rsync:

	```
	$ rsync --verbose --progress --stats --recursive --times --perms --delete /usr/home/greg/docs/ rsync@192.168.1.105:/DataVolume/rsync
	The authenticity of host '192.168.1.105 (192.168.1.105)' can't be established.
	DSA key fingerprint is 0b:f4:6f:10:49:0f:e0:4d:9a:6f:29:e3:20:b7:fe:3f.
	Are you sure you want to continue connecting (yes/no)? yes
	Warning: Permanently added '192.168.1.105' (DSA) to the list of known hosts.
	rsync@192.168.1.105's password: 
	sending incremental file list
	./
	rsync: failed to set times on "/DataVolume/rsync/.": Operation not permitted (1)
	deleting Temporary Items/.AppleDouble/.Parent
	deleting Temporary Items/.AppleDouble/
	...
	apache.txt
	        1872 100%    0.00kB/s    0:00:00 (xfer#3, to-check=163/167)
	...
	Number of files: 167
	Number of files transferred: 164
	Total file size: 6080863 bytes
	Total transferred file size: 6080863 bytes
	Literal data: 6080863 bytes
	Matched data: 0 bytes
	File list size: 2426
	File list generation time: 0.034 seconds
	File list transfer time: 0.000 seconds
	Total bytes sent: 6090921
	Total bytes received: 3139

	sent 6090921 bytes  received 3139 bytes  176639.42 bytes/sec
	total size is 6080863  speedup is 1.00
	rsync error: some files could not be transferred (code 23) at main.c(1031) [sender=3.0.2]
	```

2. Verify on Nassau

	```
	$ cd /DataVolume/rsync/
	$ ls -al apache.txt 
	-rwxrwxrwx    1 rsync    jewab        1872 Jan 23 22:14 apache.txt
	```


# Display rsync version

```
/etc # rsync --version
rsync  version 3.0.2  protocol version 30
Copyright (C) 1996-2008 by Andrew Tridgell, Wayne Davison, and others.
Web site: http://rsync.samba.org/
Capabilities:
    64-bit files, 64-bit inums, 32-bit timestamps, 64-bit long ints,
    no socketpairs, hardlinks, symlinks, IPv6, batchfiles, inplace,
    append, no ACLs, xattrs, iconv, symtimes

rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
are welcome to redistribute it under certain conditions.  See the GNU
General Public Licence for details.
```


# Install rsync

```
tar xvf rsync-3.0.2.tar 
cd rsync-3.0.2
./configure
make
make install
source .tcshrc
$ which rsync
/usr/local/bin/rsync
```

Just run the command ‘rsync’ and confirm…



# Resources

https://download.samba.org/pub/rsync/src/
http://rsync.samba.org/examples.html
http://rsync.samba.org/
http://everythinglinux.org/rsync/

http://www.oreillynet.com/linux/cmd/cmd.csp?path=r/rsync

rsync $args --password-file=/usr/rsync-3.0.2/rsync-pass --verbose --progress --stats --recursive --times --perms --delete /usr/home/greg/docs/ rsync@192.168.1.105:/DataVolume/rsync

 user@rsynchost::/share localdirectory


rsync --verbose --progress --stats --recursive --times --perms --delete /usr/home/greg/docs/ 192.168.1.105:/DataVolume/rsync