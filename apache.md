
# Apache Setup


Document root on bsd1:

	/usr/local/www/apache24/data


Install version 2.4:

	$ pkg install apache24

To run apache www server on startup, add this to /etc/rc.conf

	apache24_enable="yes"

Add ServerName to the httpd.conf configuration file:

	vi /usr/local/etc/apache24/httpd.conf

	then add this:

	ServerName 192.168.1.49


Fire up Apache the first time by running:

	/usr/local/sbin/apachectl start

From a pc on the network, point a web browser at:

	http://192.168.1.49

It works if you see the Apache Test Page


http://apache-server.com/tutorials/ATgetting-started.html#downloading


1. Get apache_1.3.31.tar.gz source code from www.apache.org and install it in a directory

	```
	/usr/local/apache-2
	```

2. Unzip and expand the file

	```
	gunzip apache_1.3.31.tar.gz
	tar xvf apache_1.3.31.tar
	```

3. Configure, make, then install

	```
	cd /usr/local/apache-2/apache_1.3.31
	./configure --prefix=/usr/local/apache
	make
	make install
	```

Note: Excellent documentation at /usr/local/apache-2/apache_1.3.31/README.configure

# Troubleshooting

## Problem

When visiting http://192.168.1.101/ in web browser, no page would display. Instead, getting connection refused.

httpd would not start:

```
$ /usr/local/sbin/apachectl start
/usr/local/sbin/apachectl start: httpd could not be started
```

and getting this error at:

```
cat /var/log/httpd-error.log

[Fri Jan 22 23:18:43 2016] [alert] mod_unique_id: unable to gethostbyname("bsd1")
[Sat Jan 23 17:28:33 2016] [alert] mod_unique_id: unable to gethostbyname("bsd1")
```

## Solution

vi /etc/hosts

then, add this line. Ensure the hostname "bsd1" resolves to 127.0.0.1:

127.0.0.1               localhost bsd1

Start apache again:

```
$ /usr/local/sbin/apachectl start
/usr/local/sbin/apachectl start: httpd started
```

This line appeared in /var/log/httpd-error.log:

```
[Sat Jan 23 21:59:25 2016] [notice] Apache/1.3.29 (Unix) configured -- resuming normal operations

$ /usr/local/sbin/apachectl configtest
Syntax OK
```



