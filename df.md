Use the "df" command to view my disk partitioning structure. This is what is looks like when the temp dir on suncs9 is full: 

```
$ df
Filesystem  1K-blocks     Used    Avail Capacity  Mounted on
/dev/ad0s2a    389128    35227   322771    10%    /
/dev/ad0s4e   5395143   853906  4109626    17%    /usr
procfs              4        4        0   100%    /proc
```

Look at root:

```
$ df /
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda5              4032092   2183460   1643808  58% /
[gmcmillan@redd3132 ~]% rsh suncs9 df /
/bin/tcsh: Not enough space

In human readable format:

```
$ df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda5             3.8G  2.1G  1.5G  58% /
/dev/hda1              30M  5.0M   23M  18% /boot
/dev/hda7             5.1G   20k  4.8G   1% /local/0
```
