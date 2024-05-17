---
layout: page
title: Git
permalink: /git/
resource: true
---

* [Access](#access)
* [Branch out of sync with master](#branch-out-of-sync-with-master)
* [Setup Workflow](#setup-workflow)
* [SSH Keys](#ssh-keys)
* [Test key-account auth](#test-key-account-auth)
* [Cloning](#cloning)
* [Multiple SSH keys for different accounts](#multiple-ssh-keys-for-different-accounts)
* [Resources](#resources)


The Git protocol was created by [Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds). He also created the original Linux kernel.

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

# Multiple SSH keys for different accounts

Problem. During a `git push` in my personal repo, git was using my work ssh key and user identity. My personal key and identity was not being used, resulting in no access.

```
$ cd /Users/gmcmilla/docs
$ git push
ERROR: Permission to gmcmillan100/docs.git denied to gmcmilla_LinkedIn.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

`ssh -vv` revealed that my work SSH key was being used:

```
$ ssh -vv -T git@github.com
OpenSSH_9.4p1, LibreSSL 3.3.6
...
debug1: identity file /Users/gmcmilla/.ssh/gmcmilla_at_linkedin.com_ssh_key type 0
debug1: identity file /Users/gmcmilla/.ssh/gmcmilla_at_linkedin.com_ssh_key-cert type -1
```
and `IdentityFile` was set to my work ssh key everywhere in `~/.ssh/config`:

```
$ cat ~/.ssh/config
...
Match host github.com user org-132020358,org-132020684,org-132020707,org-127256988,org-132020694,org-127349224
  ProxyCommand none
  IdentityFile %d/.ssh/%u_at_linkedin.com_ssh_key
```

Solution. Create an alias for my personal ssh key for my personal GitHub repo, so it does not conflict with work's ssh key. 

Article: [How do I configure git to use multiple SSH keys for different accounts](https://superuser.com/questions/1628183/how-do-i-configure-git-to-use-multiple-ssh-keys-for-different-accounts) 


1. Create a custom ssh config file. LinkedIn does not allow me to edit `~/.ssh/config`, so all customizations must go in a separate custom file.

	```
	touch ~/.ssh/config.custom
	vi ~/.ssh/config.custom
	```

2. Add a github alias (named `github-personal`) that points to my personal SSH key IdentityFile at `~/.ssh/id_rsa`:

	```
	Host github-personal
	   IdentityFile ~/.ssh/id_rsa
	   User git
	   HostName github.com
	   UseKeychain yes
	```

	The user must be `git`, and the HostName must be `github.com`.

3. Identify the origin setting inside my personal repo.

	To see which remote servers you have configured, run the `git remote` command. It lists the shortnames of each remote handle you’ve specified. If you’ve cloned your repository, you should at least see `origin`. That is the default name Git gives to the server you cloned from:

	```
	$ cd /Users/gmcmilla/docs
	$ git remote
	origin
	```

	You can also specify `-v`, which shows you the URLs that Git has stored for the shortname to be used when reading and writing to that remote:

	```
	$ git remote -v
	origin	git@github.com:gmcmillan100/docs.git (fetch)
	origin	git@github.com:gmcmillan100/docs.git (push)
	```

	In Git, `origin` is a shorthand name for the remote repository that a project was originally cloned from. More precisely, it is used instead of that original repository's URL - and thereby makes referencing much easier. Remotes are simply an alias that store the URL of repositories. You can see what URL belongs to each remote by using `git remote -v`.


4. Change the remote origin to use the new SSH alias:

	```
	$ git remote set-url "origin" "github-personal:gmcmillan100/docs.git"
	```

	Verify it changed:

	```
	$ git remote -v
	origin	github-personal:gmcmillan100/docs.git (fetch)
	origin	github-personal:gmcmillan100/docs.git (push)
	```

	The next time I `git push`, the alias will be used (see `github-personal`):

	```
	$ git push
	Enumerating objects: 5, done.
	Counting objects: 100% (5/5), done.
	Delta compression using up to 16 threads
	Compressing objects: 100% (3/3), done.
	Writing objects: 100% (3/3), 933 bytes | 933.00 KiB/s, done.
	Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
	remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
	To github-personal:gmcmillan100/docs.git
	   c1e5cd9..99d1978  master -> master
	```

4. Troubleshooting no identity and no keychain

During a `git push`, I noticed my work permissions started overriding my personal account:

```
$ git push
	ERROR: Permission to gmcmillan100/docs.git denied to gmcmilla_LinkedIn.
	fatal: Could not read from remote repository.
```

There was no personal id_rsa key identity in my keychain. It got lost somehow. Maybe LinkedIn SysOps reset it.

	```
	$ ssh-add -l
	The agent has no identities.

So I added it back in:

	```
	$ ssh-add ~/.ssh/id_rsa
	Enter passphrase for /Users/gmcmilla/.ssh/id_rsa: 
	Identity added: /Users/gmcmilla/.ssh/id_rsa (gmcmillan100@gmail.com)
	$ ssh-add -l
	4096 SHA256:fqqsrkCl6ak0zhG1nAUCt9NYX4yJcqc3Wq1gymcLPpE gmcmillan100@gmail.com (RSA)
	```

then `git push` in my `docs` repo started working again:

	```
	$ cd docs
	$ git push
	Enumerating objects: 7, done.
	Counting objects: 100% (7/7), done.
	Delta compression using up to 16 threads
	Compressing objects: 100% (4/4), done.
	Writing objects: 100% (4/4), 806 bytes | 806.00 KiB/s, done.
	Total 4 (delta 3), reused 0 (delta 0), pack-reused 0
	remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
	To github-personal:gmcmillan100/docs.git
	5b35e52..acac7c6  master -> master
	```


# Resources

GitHub Pages, https://pages.github.com/

Markdown reference, https://en.support.wordpress.com/markdown-quick-reference/
