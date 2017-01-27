---
layout: page
title: netstat
permalink: /netstat/
resource: true
---
# netstat -i

```
% netstat -i
Kernel Interface table
eth0      Link encap:Ethernet  HWaddr 00:B0:D0:C5:B8:3E
          inet addr:10.1.3.132  Bcast:10.1.7.255  Mask:255.255.248.0
          UP BROADCAST RUNNING  MTU:1500  Metric:1
          RX packets:878434 errors:0 dropped:0 overruns:0 frame:0
          TX packets:476178 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          Interrupt:11 Base address:0xec80

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:3924  Metric:1
          RX packets:42 errors:0 dropped:0 overruns:0 frame:0
          TX packets:42 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0

lo:2      Link encap:Local Loopback
          inet addr:127.0.0.2  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:3924  Metric:1
```

# netstat -nr

[gmcmillan@redd3132 ~]% netstat -nr
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
10.1.0.0        0.0.0.0         255.255.248.0   U         0 0          0 eth0
127.0.0.0       0.0.0.0         255.0.0.0       U         0 0          0 lo
0.0.0.0         10.1.7.254      0.0.0.0         UG        0 0          0 eth0

# nslookup

[gmcmillan@redd2212 ~]% nslookup redd2212
Server:  boxster.procket.com
Address:  10.1.1.15
Name:    redd2212.procket.com
Address:  10.1.2.212

