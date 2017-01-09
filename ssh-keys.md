# Generate a new ssh key

```
$ ssh-keygen -t rsa -b 4096 -C "gmcmillan100@gmail.com"
Generating public/private rsa key pair.

Enter file in which to save the key (/home/greg/.ssh/id_rsa): Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/greg/.ssh/id_rsa.
Your public key has been saved in /home/greg/.ssh/id_rsa.pub.
The key fingerprint is:
ef:63:96:f2:47:90:76:69:27:ab:62:9b:d9:df:67:ea gmcmillan100@gmail.com
The key's randomart image is:
+--[ RSA 4096]----+
|                 |
|                 |
|           . .   |
|          + = .  |
|        S. + +   |
|         .  o    |
|          .+     |
|        +=* ..  o|
|       .+B++..E+ |
+-----------------+
```

Display existing key files:

```
$ ls -al ~/.ssh
total 20
drwx------  2 greg  greg   512 Jan  2 15:27 .
drwxr-xr-x  4 greg  greg   512 Jan  1 07:12 ..
-rw-------  1 greg  greg  3326 Jan  2 15:27 id_rsa
-rw-r--r--  1 greg  greg   748 Jan  2 15:27 id_rsa.pub
-rw-r--r--  1 greg  greg  1014 Jan  2 15:17 known_hosts
```

Start the ssh-agent and add the new key:

```
$ eval "$(ssh-agent -s)"
Agent pid 1034

$ ssh-add ~/.ssh/id_rsa
Enter passphrase for /home/greg/.ssh/id_rsa: 
Identity added: /home/greg/.ssh/id_rsa (/home/greg/.ssh/id_rsa)
```

Display the new public key:

```
$ cat ~/.ssh/id_rsa.pub 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDF+17iqUOfTtcjlAEDFBNh23qXqn7WGVaXqKMEMIOtezOrHTsS4TF1vLE0aQDXKjlv1JKi1PBm5ueIr+xe+WTswXRjg5dU2iijkeBLVZKo//7HCXY+W5nNO0wCKMNmnng2JwzhGW28FpwafnuhbHahzL1R8fkYUms4qsYQCoMP+femNr1aWEv9nOs7atpXjugrmhQXwZmuUOkci3pYmOXrrDZxko2EVMaSA03mN48uxQ0ZbPn6L06gzu26cZa2Wip79NmlT/+Ilc8qnjH0MahHpXe1k/fX+3VT9IYMomekOP5jTFuZpNtzrzukSnmkjBABH7Esgo+6TSp3vjOVBm8mEQk4KvUyc8s+POY4jrZr8Z8SRFQAo6XfSs0jPhxe7VIkwIt0oV1jOb0g0x/tudpf/byFWjqmQcFh27MIzf4rsPBt+sP6Tyg59Fn6nqC0UhofuxY3rkLtVnBK6VtiKoPdK1xkSJ4vRi7GzOOMe3txOClR9k0Afdj3Oa9q8GTbXjXc65NsMj33eoHnl/f1O1nHo7gFBaPBDvaSCf16sJ6UwrLy2ZfH0cJuFk9Vfp24Sb8L5o5IL8EoY3ydX1UpXEVtxU4140780mWZKgfThxGjO5xTygLs8BcymkN0ZS+RGrocH7sTf7LIzikY1cGBeBs60BaOs90sxROjPnwpTIXqRQ== gmcmillan100@gmail.com
```

```
cat ~/.ssh/gmcmilla_at_linkedin.com_dsa_key.pub
```

# Copying SSH Keys from Mac to Linux

On Mac, do this:

```
cd .ssh
scp gmcmilla_at_linkedin* gmcmilla-ld1.linkedin.biz:~/.ssh
```

# Avoid being asked “Enter passphrase for key"

Start ssh-agent:

```
$ eval `ssh-agent -s`
Agent pid 899
```

Add my private identity to ssh-agent:

```
$ ssh-add ~/.ssh/id_rsa
Enter passphrase for /home/greg/.ssh/id_rsa: 
Identity added: /home/greg/.ssh/id_rsa (/home/greg/.ssh/id_rsa)
```

Confirm it was added:

```
$ ssh-add -l
4096 ef:63:96:f2:47:90:76:69:27:ab:62:9b:d9:df:67:ea /home/greg/.ssh/id_rsa (RSA)
```

# Add SSH Passphrase Permanently Across Reboots

(Tried this but it isn't working yet... don't know why)

https://sanctum.geek.nz/arabesque/uses-for-ssh-config/

Force the key files to be kept permanently, by adding them in your ~/.ssh/config file.

```
cd ~/.ssh/
touch config
vi config
```

then add this inside:

```
IdentityFile ~/.ssh/id_rsa.pub
```

