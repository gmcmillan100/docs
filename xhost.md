Use the "xhost +" command to tell this display that it's okay for a
process running on a remote host to write to my local display. Note
that the first login did not work because suncs9 does not know my
made-up hostname "greg-pc". On the second attempt, it recognizes my
DHCP assigned hostname "dhcp5132.procket". Then, Enter "echo $DISPLAY"
to check if my display environment variable is correct. Use this echo
command to see if my display variable will propogate all on its own
for when I enter the "rlogin" command. It's supposed to propogate, but
it does not always do it. If it didn't propogate, we would either set
the display environment variable or give a display parameter
ourselves when we start it up, which is usually "-d". If I don't him a
display name on his parameter line, then he's supposed to read the
environment variable. The environment variable gets derrived from the
hostname that I inherit from the network. 

      greg-pc# xhost + suncs9
      suncs9 being added to access control list
      greg-pc# rlogin suncs9
      ...
      Password:
      Login incorrect
      login: gmcmillan
      Password:
      Last login: Thu Sep 13 17:10:14 from dhcp5132.procket 
      ...
      [gmcmillan@suncs9 ~]% echo $DISPLAYG
      dhcp5132.procket.com:0
      [gmcmillan@suncs9 ~]% maker &
      [1] 10404
      [gmcmillan@suncs9 ~]% starting maker ...

Note: I could enter just "xhost +", but then everyone can write to my
display. In most environments, that's not very smart. However, some
people do it.



greg-pc# xhost + suncs9
suncs9 being added to access control list
greg-pc#