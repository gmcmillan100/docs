---
layout: page
title: mount
permalink: /mount/
resource: true
---
Mount a file system.

An example using "mount" and "fstab"
===================================

cdrom umount
-----------
Given: There is a CD in the cdrom drive. I want to eject the cd.

Couldn't umount it like this:

   bsd1 /home/backup> umount /cdrom/
   umount: /cdrom: not currently mounted

So I checked the filesystem display:

bsd1 /home/backup> df -h
Filesystem    Size   Used  Avail Capacity  Mounted on
/dev/ad0s1a   4.8G    56M   4.4G     1%    /
/dev/ad0s1e   984M   2.0K   906M     0%    /scratch
/dev/ad0s1f   224G   4.8G   201G     2%    /usr
procfs        4.0K   4.0K     0B   100%    /proc
/dev/ad1s1e    29G   693M    26G     3%    /ad1s1e-backup
/dev/acd0c    623M   623M     0B   100%    /dist

and now I could umount the cd using /dev/acd0c:

   bsd1 /home/backup> umount /dev/acd0c

the cd could not be ejected.



1. Inspect my disk partitioning structure:

greg-pc# df
Filesystem  1K-blocks     Used    Avail Capacity  Mounted on
/dev/ad0s2a    389128    35242   322756    10%    /
/dev/ad0s4e   5395143   853909  4109623    17%    /usr
procfs              4        4        0   100%    /proc
greg-pc# 


2. Graft the msdos file system type, which is located at the slice /dev/ad0s1,
   onto my local file system tree:

greg-pc# mount -t msdos /dev/ad0s1 /mnt


3. Verify that the new slice is mounted:

greg-pc# df
Filesystem  1K-blocks     Used    Avail Capacity  Mounted on
/dev/ad0s2a    389128    35242   322756    10%    /
/dev/ad0s4e   5395143   853909  4109623    17%    /usr
procfs              4        4        0   100%    /proc
/dev/ad0s1   12044976  5047760  6997216    42%    /mnt

4. List the directory contents of "/mnt". Notice that I'll see more
   contents than if I viewed the directory via a DOS or Windows
   command because they hide files.

   Now I can copy files in and out of this DOS slice. However,
   remember that the text files delimit logical with the carriage returns
   and line feed. DOS uses two characters, whereas BSD uses only
   one. However, I can use a conversion routine to fix this, which is
   usually stored in a package called mtools. This routine enables me
   to add or delete the extra characters when I'm moving file back and forth:

greg-pc# ls /mnt
ADOBEAPP                COMPATID.TXT            MSDOS.SYS               WINDOWS                 io.sys
ATI                     CONFIG.BAK              My Documents            Z2.BAT                  liprefs.js
AUTOEXEC.BAK            CONFIG.DOS              My Music                ZZ.EXE                  mp3
AUTOEXEC.BAT            CONFIG.SYS              NCDTREE                 ZZTOP.BAT               npdrmv2.dll
AUTOEXEC.DOS            DELL                    NETLOG.TXT              _RESTORE                npdrmv2.zip
AdobeWeb.log            DELL.SDR                OSINFO.ENG              autoexec.nav            npds.zip
BACKUP                  DETLOG.TXT              Program Files           command.PIF             npdsplay.dll
BOOTLOG.PRV             Dumplog.txt             Recycled                command.com             npwmsdrm.dll
BOOTLOG.TXT             LOGO.SYS                SCANDISK.LOG            data                    procket
CHOICE.COM              MSDOS.---               VIDEOROM.BIN            dvd-decryption-code     trash

5. Look at my fstab to see if I have an entry to mount the file
   systems on my CD-ROM drive:


greg-pc# cat /etc/fstab
# Device                Mountpoint      FStype  Options         Dump    Pass#
/dev/ad0s3b             none            swap    sw              0       0
/dev/ad0s2a             /               ufs     rw              1       1
#/dev/X         /scratch                ufs     rw              2       2
/dev/ad0s4e             /usr            ufs     rw              2       2
/dev/acd0c              /cdrom          cd9660  ro,noauto       0       0
proc                    /proc           procfs  rw              0       0
greg-pc# 


If I entered "mount cdrom", it would mount a CD-ROM in the drive. The
"noauto" means don't try it automatically when booting but leave it in a pseudo
state, so I can manually mount the mount point if I'm root. 

If I always wanted to mount my DOS slice automatically when I'm
booting, create an entry in the fstab table. The first thing I want to
do is create a mount point for it that is not "mnt". The reason is
that "mnt" is a good thing to have hanging around for scratch. 

     1) At the top level, create a mount point, such as "mkdir dos". 
        Call it whatever I want to:

greg-pc# pwd
/
greg-pc# mkdir dos
greg-pc# ls
.cshrc          cdrom           etc             modules         stand
.profile        compat          home            proc            sys
COPYRIGHT       dev             kernel          root            tmp
bin             dist            kernel.GENERIC  sbin            usr
boot            dos             mnt             scratch         var
greg-pc# 


     2) In fstab, create a line like this:

# Device         Mountpoint      FStype  Options         Dump    Pass#
/dev/ad0s1       dos             msdos   rw              0       0

     3) (optional) Put a commented out entry in the fstab to remind myself of the
        slice name or file type that I use to mount.

     4) Remount all the filesystems described in fstab

greg-pc# mount -a

     5) Verify that the new slice is mounted and try accessing the
        slice:

greg-pc# df
Filesystem  1K-blocks     Used    Avail Capacity  Mounted on
/dev/ad0s2a    389128    35261   322737    10%    /
/dev/ad0s4e   5395143   853909  4109623    17%    /usr
/dev/ad0s1   12044976  5016960  7028016    42%    /dos
procfs              4        4        0   100%    /proc
greg-pc# cd /dos
greg-pc# ls
ADOBEAPP                Dumplog.txt             _RESTORE
ATI                     LOGO.SYS                autoexec.nav
AUTOEXEC.BAK            MSDOS.---               command.PIF
AUTOEXEC.BAT            MSDOS.SYS               command.com
AUTOEXEC.DOS            My Documents            data
AdobeWeb.log            My Music                dvd-decryption-code
BACKUP                  NCDTREE                 io.sys
BOOTLOG.PRV             NETLOG.TXT              liprefs.js
BOOTLOG.TXT             OSINFO.ENG              mp3
CHOICE.COM              Program Files           npdrmv2.dll
COMPATID.TXT            Recycled                npdrmv2.zip
CONFIG.BAK              SCANDISK.LOG            npds.zip
CONFIG.DOS              VIDEOROM.BIN            npdsplay.dll
CONFIG.SYS              WINDOWS                 npwmsdrm.dll
DELL                    Z2.BAT                  procket
DELL.SDR                ZZ.EXE                  trash
DETLOG.TXT              ZZTOP.BAT
greg-pc# 




