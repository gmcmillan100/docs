---
layout: page
title: lpq
permalink: /lpq/
resource: true
---

Checking a printer que:

[gmcmillan@suncs9 ~]% lpq -P plum
plum_dp_lt is ready and printing
Rank    Owner   Job     File(s)                         Total Size
active  gmcmillan       37      MSDP.config.ps.AA22a5           602965 bytes
1st     gmcmillan       38      MSDP.config.ps.BA22a5           602965 bytes
2nd     gmcmillan       39      MSDP.verify.ps.CA22a5           596401 bytes
3rd     gmcmillan       40      MSDP.verify.ps.DA22a5           596401 bytes
4th     kevin   521     (stdin)                         5943 bytes
5th     chigaki 46      /tmp/LED_v_2_2.ps.pA04e8        367759 bytes
6th     gmcmillan       47      standard input                  10164 bytes
7th     gmcmillan       48      standard input                  10164 bytes
8th     gmcmillan       52      standard input                  10164 bytes
[gmcmillan@suncs9 ~]% 


Removing a print job:

[gmcmillan@suncs9 ~]% lpq -P plum
plum_dp_lt is ready and printing
Rank    Owner   Job     File(s)                         Total Size
active  gmcmillan       167     RoutingProtocols.ps.GA54        42008496 bytes
[gmcmillan@suncs9 ~]% 
[gmcmillan@suncs9 ~]% 
[gmcmillan@suncs9 ~]% 
[gmcmillan@suncs9 ~]% lprm -P plum 167
plum_dp_lt-167: cancelled
[gmcmillan@suncs9 ~]%

# lpr

Print file:

lpr -Poak doc.txt

# lprm

To cancel a print job for which I am the owner:

[gmcmillan@redd3132 ~/notes]% lprm -Pelm 659
Printer elm_dp_lt@redd3132:
elm_dp_lt-659: cancelled

