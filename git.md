---
layout: page
title: Git
permalink: /git/
resource: true
---

* [Test key-account auth](#test-key-account-auth)


The Git protocol was created by `Linus Torvalds <https://en.wikipedia.org/wiki/Linus_Torvalds>`_. He also created the original Linux kernel.


# Access

repo, https://github.com/gmcmillan100/docs

pages, https://gmcmillan100.github.io/docs/

Test ssh access:

~~~~
$ ssh -T git@github.com
Hi gmcmillan100! You've successfully authenticated, but GitHub does not provide shell access.
~~~~

# Branch out of sync with master

Do this to bring the lastest changes in master into your local Git branch:

git checkout master
git pull
git checkout <your-branch-name>
git rebase master

# Setup Workflow

Global config:

```
git config --global user.email "gmcmillan100@gmail.com"
git config --global user.name "Greg McMillan"
```

Verify the global `.gitconfig` looks correct:

```
$ cat .gitconfig
# This is Git's per-user configuration file.
[user]
	name = gmcmillan100
	email = gmcmillan100@gmail.com
```

Initialize repo and pull down a copy:

~~~~
mkdir docs
cd docs
git init .
git remote add origin git@github.com:gmcmillan100/docs.git
cat .git/config
git pull git@github.com:gmcmillan100/docs.git master
~~~~

Push the current branch and set the remote as upstream:

~~~~
git fetch
git branch --set-upstream-to=origin/master master
~~~~

Upload some changes:

~~~~
git add git.md
git commit -m "initial commit"
git pull --rebase
git push
~~~~

# SSH Keys

Main article: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-linux

Generate a new ssh key:

~~~~
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
~~~~

Display existing key files:

~~~~
$ ls -al ~/.ssh
total 20
drwx------  2 greg  greg   512 Jan  2 15:27 .
drwxr-xr-x  4 greg  greg   512 Jan  1 07:12 ..
-rw-------  1 greg  greg  3326 Jan  2 15:27 id_rsa
-rw-r--r--  1 greg  greg   748 Jan  2 15:27 id_rsa.pub
-rw-r--r--  1 greg  greg  1014 Jan  2 15:17 known_hosts
~~~~

Start the ssh-agent and add the new key:

~~~~
$ eval "$(ssh-agent -s)"
Agent pid 1034

$ ssh-add ~/.ssh/id_rsa
Enter passphrase for /home/greg/.ssh/id_rsa: 
Identity added: /home/greg/.ssh/id_rsa (/home/greg/.ssh/id_rsa)
~~~~

Display the new public key:

~~~~
$ cat ~/.ssh/id_rsa.pub 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDF+17iqUOfTtcjlAEDFBNh23qXqn7WGVaXqKMEMIOtezOrHTsS4TF1vLE0aQDXKjlv1JKi1PBm5ueIr+xe+WTswXRjg5dU2iijkeBLVZKo//7HCXY+W5nNO0wCKMNmnng2JwzhGW28FpwafnuhbHahzL1R8fkYUms4qsYQCoMP+femNr1aWEv9nOs7atpXjugrmhQXwZmuUOkci3pYmOXrrDZxko2EVMaSA03mN48uxQ0ZbPn6L06gzu26cZa2Wip79NmlT/+Ilc8qnjH0MahHpXe1k/fX+3VT9IYMomekOP5jTFuZpNtzrzukSnmkjBABH7Esgo+6TSp3vjOVBm8mEQk4KvUyc8s+POY4jrZr8Z8SRFQAo6XfSs0jPhxe7VIkwIt0oV1jOb0g0x/tudpf/byFWjqmQcFh27MIzf4rsPBt+sP6Tyg59Fn6nqC0UhofuxY3rkLtVnBK6VtiKoPdK1xkSJ4vRi7GzOOMe3txOClR9k0Afdj3Oa9q8GTbXjXc65NsMj33eoHnl/f1O1nHo7gFBaPBDvaSCf16sJ6UwrLy2ZfH0cJuFk9Vfp24Sb8L5o5IL8EoY3ydX1UpXEVtxU4140780mWZKgfThxGjO5xTygLs8BcymkN0ZS+RGrocH7sTf7LIzikY1cGBeBs60BaOs90sxROjPnwpTIXqRQ== gmcmillan100@gmail.com
~~~~

# Test key-account auth

After adding the key to github.com > settings, verify Github can see the key-account mapping from my local host:

```
$ ssh -T git@github.com
Hi gmcmillan100! You've successfully authenticated, but GitHub does not provide shell access.
```

Can also use `-i` for more control:

```
$ ssh -i ~/.ssh/id_rsa -o IdentityAgent=none -T git@github.com
Hi gmcmillan100! You've successfully authenticated, but GitHub does not provide shell access.
```
and notice how this key produces a different user response:

```
$ ssh -i ~/.ssh/gmcmilla_at_linkedin.com_ssh_key -o IdentityAgent=none -T git@github.com
Hi gmcmilla_LinkedIn! You've successfully authenticated, but GitHub does not provide shell access.
```

# Cloning

git clone git@github.com:gmcmillan100/docs.git

# Resources

GitHub Pages, https://pages.github.com/

Markdown reference, https://en.support.wordpress.com/markdown-quick-reference/
