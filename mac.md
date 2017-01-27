---
layout: page
title: Mac
permalink: /mac/
resource: true
---

Boot Up
-------

Boot from (USB or DVD) can be activated with, pressing Option (alt) key during start up to select where to boot from.

On boot, press "c" key to book from CD.

If you are trying to repair the existing OS X on the HDD, then use the Internet Recovery option in the OSX Utilities. (cmd-r).

To check the hardware press "D" during start up, that should start the Apple Hardware test.


Boot into single user mode:

command + s (for mac)

windowskey + s (for a windows keyboard)




Mounting a USB drive from single user mode
------------------------------------------

On boot up, the hard drive is mounted read-only by default. Make it r/w:

$ mount -uw /

Make sure the USB drive is not plugged into the mac. Find out which devices are mounted by default:

$ ls /dev/disk*
/dev/disk0/	/dev/disk0s1	/dev/disk0s2	/dev/disk0s3	

Next, plug in the USB drive and find out device ID assigned to the USB:

$ ls /dev/disk*
/dev/disk0/	/dev/disk0s1	/dev/disk0s2	/dev/disk0s3
/dev/disk1/	/dev/disk1s1	/dev/disk1s2

Create mount points to the ID on slice 2 (/dev/disk1s2).

For FAT formatted:

$ mkdir /Volumes/usb
$ mount_msdos /dev/disk1s2 /Volumes/usb


For Mac formatted:

$ mkdir /Volumes/usb
$ mount -t hfs /dev/disk1s2 /Volumes/usb


http://m.alvinalexander.com/mac-os-x/mac-osx-single-user-mode-usb-drive

 

Progress bar while copying a file
----------------------------------

Use rsync (instead of cp)

$ rsync --progress /copy/from /copy/to

