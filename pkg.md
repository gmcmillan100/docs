---
layout: page
title: pkg
permalink: /pkg/
resource: true
---
pkg provides an interface for manipulating packages: registering, adding, removing and upgrading packages.


pkg install <package-name>
pkg search <package-name>
pkg info
pkg stats


pkg repo lookup details:

	$ pkg -vv
	...
	Repositories:
		FreeBSD: { 
			url             : "pkg+http://pkg.FreeBSD.org/FreeBSD:10:i386/quarterly",
	...


Sometimes a "pkg search" produces no results. Issue "pkg update -f" to update the repo catalogue, then reissue "pkg search":

$ pkg update -f
Updating FreeBSD repository catalogue...
Fetching meta.txz: 100%    944 B   0.9kB/s    00:01    
Fetching packagesite.txz: 100%    5 MiB 694.7kB/s    00:08    
Processing entries:  26%





See https://www.freebsd.org/doc/en/articles/linux-users/software.html