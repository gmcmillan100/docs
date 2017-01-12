
```
ipconfig [/all | /release | /renew]
ipconfig > stuff.txt
edit <filename>
arp -a
tracert <host-ipaddr>
route print
netstat [-a | -e | -r | -s]
hostname
continuous "ping <ip-addr> -t". Understanding the difference between these types of ping output 
```

# ping -t

```
C:\Documents and Settings\Greg McMillan>ping 210.10.10.10 -t

Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Destination host unreachable.
Destination host unreachable.
Destination host unreachable.
Destination host unreachable.
Destination host unreachable.
Destination host unreachable.
Destination host unreachable.
Destination host unreachable.
Destination host unreachable.
Destination host unreachable.
Destination host unreachable.
Reply from 210.10.10.10: bytes=32 time<1ms TTL=254
Reply from 210.10.10.10: bytes=32 time<1ms TTL=254
Reply from 210.10.10.10: bytes=32 time<1ms TTL=254
Reply from 210.10.10.10: bytes=32 time<1ms TTL=254
```

# netstat -an

```
C:\Documents and Settings\Greg McMillan>netstat -an | more

Active Connections

  Proto  Local Address          Foreign Address        State
  TCP    0.0.0.0:135            0.0.0.0:0              LISTENING
  TCP    0.0.0.0:445            0.0.0.0:0              LISTENING
  TCP    0.0.0.0:1025           0.0.0.0:0              LISTENING
  TCP    0.0.0.0:1028           0.0.0.0:0              LISTENING
  TCP    0.0.0.0:5000           0.0.0.0:0              LISTENING
  TCP    0.0.0.0:14238          0.0.0.0:0              LISTENING
  TCP    192.168.5.159:139      0.0.0.0:0              LISTENING
  TCP    192.168.5.159:15046    0.0.0.0:0              LISTENING
  UDP    0.0.0.0:445            *:*
  UDP    0.0.0.0:500            *:*
  UDP    0.0.0.0:1029           *:*
  UDP    0.0.0.0:1033           *:*
  UDP    0.0.0.0:1042           *:*
  UDP    0.0.0.0:1098           *:*
  UDP    0.0.0.0:14237          *:*
  UDP    127.0.0.1:123          *:*
  UDP    127.0.0.1:1077         *:*
  UDP    127.0.0.1:1900         *:*
  UDP    192.168.5.159:123      *:*
  UDP    192.168.5.159:137      *:*
  UDP    192.168.5.159:138      *:*
  UDP    192.168.5.159:1900     *:*
  UDP    192.168.5.159:8366     *:*
  UDP    192.168.5.159:12762    *:*
  ```


Port "139" is windows networking. That means I'm acting as a Windows's server for whover
is on the network. Whenever connecting to the Internet, make sure this is disabled. However, 
for internal networking, I might need it enabled for services like file sharing with 
other users. 

"LISTENTING" means my box is acting as a server for other users. Not good. 

# nslookup

Use "nslookup" alone to retrieve/test the nslookup table. Enter various "server" and "www..." 
commands at the ">" prompt.

```
C:\Documents and Settings\Greg McMillan>nslookup
*** Default servers are not available
Default Server:  UnKnown
Address:  127.0.0.1

> www.foundrynet.com
Server:  UnKnown
Address:  127.0.0.1

*** UnKnown can't find www.foundrynet.com: No response from server
>
> server 1.1.1.1
Default Server:  [1.1.1.1]
Address:  1.1.1.1
```

# And More

```
> ?
Commands:   (identifiers are shown in uppercase, [] means optional)
NAME            - print info about the host/domain NAME using default server
NAME1 NAME2     - as above, but use NAME2 as server
help or ?       - print info on common commands
set OPTION      - set an option
    all                 - print options, current server and host
    [no]debug           - print debugging information
    [no]d2              - print exhaustive debugging information
    [no]defname         - append domain name to each query
    [no]recurse         - ask for recursive answer to query
    [no]search          - use domain search list
    [no]vc              - always use a virtual circuit
    domain=NAME         - set default domain name to NAME
    srchlist=N1[/N2/.../N6] - set domain to N1 and search list to N1,N2, etc.
    root=NAME           - set root server to NAME
    retry=X             - set number of retries to X
    timeout=X           - set initial time-out interval to X seconds
    type=X              - set query type (ex. A,ANY,CNAME,MX,NS,PTR,SOA,SRV)
    querytype=X         - same as type
    class=X             - set query class (ex. IN (Internet), ANY)
    [no]msxfr           - use MS fast zone transfer
    ixfrver=X           - current version to use in IXFR transfer request
server NAME     - set default server to NAME, using current default server
lserver NAME    - set default server to NAME, using initial server
finger [USER]   - finger the optional NAME at the current default host
root            - set current default server to the root
ls [opt] DOMAIN [> FILE] - list addresses in DOMAIN (optional: output to FILE)
    -a          -  list canonical names and aliases
    -d          -  list all records
    -t TYPE     -  list records of the given type (e.g. A,CNAME,MX,NS,PTR etc.)
view FILE           - sort an 'ls' output file and view it with pg
exit            - exit the program
```
