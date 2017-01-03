# Access

repo, https://github.com/gmcmillan100/docs

pages, https://gmcmillan100.github.io/docs/

Test ssh access:

~~~~
$ ssh -T git@github.com
Hi gmcmillan100! You've successfully authenticated, but GitHub does not provide shell access.
~~~~


# Setup Workflow

~~~~
mkdir docs
cd docs
git init .
git remote add origin git@github.com:gmcmillan100/docs.git
cat .git/config
git pull git@github.com:gmcmillan100/docs.git master
git branch --set-upstream-to=origin/master master
git pull --rebase
git add git.md
git commit -m "initial commit"
git push
~~~~



# Cloning

git clone git@github.com:gmcmillan100/docs.git

# Resources

Markdown reference, https://en.support.wordpress.com/markdown-quick-reference/
