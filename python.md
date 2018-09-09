---
layout: page
title: Python
permalink: /python/
resource: true
---

* [Terminology](#terminology)
* [Jinja2](#jinja2)
* [Hello World](#hello-world)
* [Installation](#installation)
* [Interpreter](#interpreter)
* [Pip](#pip)
* [Path](#path)
* [Packages](#packages)
* [Local Web Server](#local-web-server)
* [Resources](#resources)

# Terminology

* **Class**: A blue print from with objects (walls, roofs, ...) are made. What is an object? Object can be anything that has some attributes/state.

# Jinja2

Jinja2 is a full featured template engine for Python. It has full unicode support, an optional integrated sandboxed execution environment, widely used and BSD licensed.

http://jinja.pocoo.org/


# Hello World

1. Open a terminal shell.

2. Create a script file named hello.py:

	```
	touch hello.py
	vi hello.py
	```

3. Enter the following program into the file:

	```
	#!/usr/bin/python
	# My first python program
	print "Hello, World!\n"
	```

4. Save and close the file:

	```
	:wq!
	```

5. Make the file executable:

	```
	chmod +x hello.py
	```

6. Run the program:

	```
	./hello.py
	Hello, World!
	```

# Installation

Install Python using Homebrew.

http://docs.python-guide.org/en/latest/starting/install/osx/

```
$ brew install python
==> Downloading https://homebrew.bintray.com/bottles/python-2.7.11.yosemite.bottle.1.tar.gz
######################################################################## 100.0%
==> Pouring python-2.7.11.yosemite.bottle.1.tar.gz
==> /usr/local/Cellar/python/2.7.11/bin/python -s setup.py --no-user-cfg install --force --verbose --single
==> /usr/local/Cellar/python/2.7.11/bin/python -s setup.py --no-user-cfg install --force --verbose --single
==> /usr/local/Cellar/python/2.7.11/bin/python -s setup.py --no-user-cfg install --force --verbose --single
==> Caveats
Pip and setuptools have been installed. To update them
  pip install --upgrade pip setuptools
You can install Python packages with
  pip install <package>
They will install into the site-package directory
  /usr/local/lib/python2.7/site-packages
See: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Homebrew-and-Python.md
.app bundles were installed.
Run `brew linkapps python` to symlink these to /Applications.
==> Summary
Ì†ºÌΩ∫  /usr/local/Cellar/python/2.7.11: 4,869 files, 65.5M
$ which python
/usr/local/bin/python 
```

```
$ which python
/usr/local/bin/python
chigaki-mn1:bin chigaki$ brew switch python 2.7.11
Cleaning /usr/local/Cellar/python/2.7.11
39 links created for /usr/local/Cellar/python/2.7.11
chigaki-mn1:bin chigaki$ python -V
Python 2.6.9
```

```
chigaki-mn1:bin chigaki$ echo $PATH
/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/linkedin/bin:/export/content/linkedin/bin
chigaki-mn1:bin chigaki$ pwd
/usr/bin
chigaki-mn1:~ chigaki$ vi .bash_profile
chigaki-mn1:~ chigaki$ echo $PATH
/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/linkedin/bin:/export/content/linkedin/bin
chigaki-mn1:~ chigaki$ source .bash_profile
chigaki-mn1:~ chigaki$ echo $PATH
/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/Cellar:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/linkedin/bin:/export/content/linkedin/bin
chigaki-mn1:~ chigaki$ python -V
Python 2.7.11
```


# Interpreter

```
gmcmilla-mn:restli gmcmilla$ python
Python 2.7.2 (default, Oct 11 2012, 20:14:37) 
[GCC 4.2.1 Compatible Apple Clang 4.0 (tags/Apple/clang-418.0.60)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> 
>>> the_world_is_flat = 1
>>> if the_world_is_flat:
...     print "Be careful not to fall off!"
... 
Be careful not to fall off!
>>> 
```

# Pip
Pip is Python's package manager, http://stackoverflow.com/questions/17271319/installing-pip-on-mac-os-x

To install pip:

```
$ sudo easy_install pip
Password:
Searching for pip
Reading http://pypi.python.org/simple/pip/
Best match: pip 7.1.0
Downloading https://pypi.python.org/packages/source/p/pip/pip-7.1.0.tar.gz#md5=d935ee9146074b1d3f26c5f0acfd120e
Processing pip-7.1.0.tar.gz
Running pip-7.1.0/setup.py -q bdist_egg --dist-dir /tmp/easy_install-IKVZhk/pip-7.1.0/egg-dist-tmp-6nzxHx
```

To uninstall pip:

```
sudo pip uninstall pip
```

To install the oauth2 package on my local machine:

Note: Permissions must be open for the user on this directory: /Users/<username>/Library/Caches/pip/http

```
$ sudo pip install oauth2
Password:
Downloading/unpacking oauth2
  Downloading oauth2-1.5.211.tar.gz
  Running setup.py egg_info for package oauth2
Downloading/unpacking httplib2 (from oauth2)
  Downloading httplib2-0.9.tar.gz (204kB): 204kB downloaded
  Running setup.py egg_info for package httplib2
Installing collected packages: oauth2, httplib2
  Running setup.py install for oauth2
  Running setup.py install for httplib2
Successfully installed oauth2 httplib2
Cleaning up...
```

See where it's installed:

```
$ pip show oauth2
---
Name: oauth2
Version: 1.5.211
Location: /Library/Python/2.6/site-packages
Requires: httplib2
```

and do a pip list to display it:

```
$ pip list
...
oauth2 (1.5.211)
...
```

Tip: See also python setup.py install


# .pth files

http://stackoverflow.com/questions/700375/how-to-add-a-python-import-path-using-a-pth-file
If you put a .pth file in the site-packages directory containing a path, python searches this path for imports.

```
cd /Library/Python/2.7/site-packages
sudo vi mypath.pth
# Add these module paths to mypath.pth, save, and quit
/Library/Python/2.6/site-packages
/usr/local/linkedin/lib/python2.6/site-packages
```

Enter the python interpreter and verify the new paths are discovered:

```
gmcmilla-mn:restli gmcmilla$ python
Python 2.7.2 (default, Oct 11 2012, 20:14:37) 
[GCC 4.2.1 Compatible Apple Clang 4.0 (tags/Apple/clang-418.0.60)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> print('\n'.join(sys.path))
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'sys' is not defined
>>> import sys; print('\n'.join(sys.path))
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python27.zip
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-darwin
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac/lib-scriptpackages
/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-tk
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-old
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-dynload
/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC
/Library/Python/2.7/site-packages
/Library/Python/2.6/site-packages
/usr/local/linkedin/lib/python2.6/site-packages
```

# Path

Print Python's system path:

```
gmcmilla-mn:restli gmcmilla$ python
Python 2.7.2 (default, Oct 11 2012, 20:14:37) 
[GCC 4.2.1 Compatible Apple Clang 4.0 (tags/Apple/clang-418.0.60)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import sys; print('\n'.join(sys.path))
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python27.zip
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-darwin
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac/lib-scriptpackages
/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-tk
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-old
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-dynload
/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC
/Library/Python/2.7/site-packages
>>> 
```

Add an additional path. In this case, a path to the oauth2 module that is installed under /Library/Python/2.6/site-packages:

```
>>> import sys; sys.path.append('/Library/Python/2.6/site-packages')
>>> import oauth2
>>> import sys; print('\n'.join(sys.path))
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python27.zip
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-darwin
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac/lib-scriptpackages
/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-tk
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-old
/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-dynload
/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC
/Library/Python/2.7/site-packages
/Library/Python/2.6/site-packages
>>> 
```

More on sys.path here https://docs.python.org/2/library/site.html


# Packages

If you have PIP installed, issue `pip list` to see what packages have been installed with your installer tools.

Tons of LinkedIn packages at /usr/local/linkedin/lib/python2.6/site-packages

# Local Web Server

```
gmcmilla-mn:restli gmcmilla$ sudo python -m SimpleHTTPServer 80
Password:
Serving HTTP on 0.0.0.0 port 80 ...
```

# PEX

A Python EXecutable (PEX) file is a self-contained virtual environment.

LinkedIn's Sphinx ECL product comes from a PEX. Sphinx’s PEX, a zip file, is located at /export/content/linkedin/bin/wrapped-python-tools.pex. It can be extracted by using python -m zipfile -e wrapped-python-tools.pex mydir/. This PEX contains Sphinx’s package and all of its dependencies, so Sphinx can run.

A PEX files looks like this:

```
{“requirements”: [“Sphinx==1.4.1", “wrapped-python-tools==0.0.23”, “cssselect==0.9.1", “Pygments==2.1.3”, “ordereddict==1.1", “imagesize==0.7.1”, “premailer==2.9.2", “sphinx-rtd-theme==0.1.9”, “nose==1.1.2", “pytz==2016.4”, “docutils==0.12", “Babel==2.3.4”, “lxml==2.3.4", “Jinja2==2.8”, “CommonMark==0.5.4", “six==1.10.0”, “MarkupSafe==0.23", “recommonmark==0.4.0”, “snowballstemmer==1.2.1", “modernize==0.4”, “cssutils==1.0", “alabaster==0.7.8”], “inherit_path”: false, “distributions”: {“nose-1.1.2-py2-none-any.whl”: “143b9d80385276cfaff78091614f7aaf41ad2dcb”, “six-1.10.0-py2.py3-none-any.whl”: “a99dfb27e60da3957f6667853b91ea52e173da0a”, “lxml-2.3.4-cp27-none-macosx_10_9_x86_64.whl”: “964cd3f189d5f14e18f0844ba5d23016590f643f”, “imagesize-0.7.1-py2.py3-none-any.whl”: “dcc3cf481002b74e2c8fe959078d31aadf923966”, “ordereddict-1.1-py2-none-any.whl”: “848a2f5843cc654727c041783a501533bf3bdd84”, “Babel-2.3.4-py2.py3-none-any.whl”: “5f2ab82fbed8def18aa827755c505510686c0e14”, “pytz-2016.4-py2-none-any.whl”: “3d345d087668f45b40de7b858cc59a38c3c62230”, “modernize-0.4-py2-none-any.whl”: “6aca689f48e4896816a2c488f2fe6e2c403ad9fa”, “Pygments-2.1.3-py2.py3-none-any.whl”: “aef4543856715a6889040a9a7ace8efce9658613”, “cssselect-0.9.1-py2-none-any.whl”: “f69c5b692491368b2888fa96882e8d728da88bf8”, “recommonmark-0.4.0-py2.py3-none-any.whl”: “b681932ac8d118049683bc89d8d444d0a79d4527”, “sphinx_rtd_theme-0.1.9-py2-none-any.whl”: “f60ebdc7e596403cd567a90557ded55ac146507f”, “MarkupSafe-0.23-cp27-none-macosx_10_9_x86_64.whl”: “a3e7734ab71792055875afdb2b571872cbc1c890”, “Jinja2-2.8-py2.py3-none-any.whl”: “c25769aefd4fef6c1c5d506ee90f542002c52c40”, “CommonMark-0.5.4-py2-none-any.whl”: “a2c12fd2155111120d082297d83654695a541508”, “premailer-2.9.2-py2-none-any.whl”: “e30e6b64db42ff4badecd2061540aeb181db2a52”, “docutils-0.12-py2-none-any.whl”: “b704e65e6474700f372cbbfb495e6926bc1610ec”, “alabaster-0.7.8-py2.py3-none-any.whl”: “2f0a613fd95478fd6c62e4466637551ee5e8ae48”, “Sphinx-1.4.1-py2.py3-none-any.whl”: “bd867b505ac9edc475beb4fbe111e98dfacda82d”, “snowballstemmer-1.2.1-py2-none-any.whl”: “5104f870e0d1b03142ac3093ae6b4c8ad30d926b”, “cssutils-1.0-py2-none-any.whl”: “218427ef3350aa297ec27b435a3c11407d8224a7”, “wrapped_python_tools-0.0.23-py2-none-any.whl”: “fbebdcbed5491a9df24d5652e03376e1b0792b58”}, “always_write_cache”: false, “code_hash”: “da39a3ee5e6b4b0d3255bfef95601890afd80709", “zip_safe”: true, “ignore_errors”: false, “build_properties”: {“platform”: “macosx-10.9-x86_64”, “version”: [2, 7, 11], “class”: “CPython”}}
```

# Resources

https://www.python.org/

Kid basics, http://www.mathandcoding.org/python-course.html

