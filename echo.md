Use "echo" to identify the search path for the executable files that
I'm using. For example, my "ping" utility is coming from /usr/sbin/ping:


[gmcmillan@suncs9 ~]% which ping
/usr/sbin/ping
[gmcmillan@suncs9 ~]% echo $path
/home/gmcmillan/bin /tools/pkgs/framemaker/6.0/bin /tools/bin /tools/share/cad/bin /usr/dt/bin /usr/openwin/bin /usr/ucb /bin /usr/bin /usr/ccs/bin /tools/pkgs/syscad /sbin /usr/sbin
[gmcmillan@suncs9 ~]% 
