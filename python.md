---
layout: page
title: Python
permalink: /python/
resource: true
---

* [Terminology](#terminology)
* [Datetime Module](#datetime-module)
* [Files](#files)
* [Internet Data](##internet-data)
* [JSON](##json)
* [OS Path Utilities](#os-path-utilities)
* [Jinja2](#jinja2)
* [Hello World](#hello-world)
* [Installation](#installation)
* [Interpreter](#interpreter)
* [Pip](#pip)
* [Path](#path)
* [Packages](#packages)
* [Local Web Server](#local-web-server)
* [PEX](#pex)
* [VScode](#vscode)
* [Raspberry Pi](#raspberry-pi)
* [Flask](#flask)
* [Resources](#resources)

# Terminology

* **Module**: A module is a Python object with arbitrarily named attributes that you can bind and reference. Simply, a module is a file consisting of Python code. A module can define functions, classes and variables. A module can also include runnable code.

* **Class**: A blue print from which objects (walls, roofs, ...) are made. What is an object? Object can be anything that has some attributes/state. Classes encapsulate functionality that can be kept together and passed around, as a complete module for use, in other projects.

* **Function**: They are defined with the `def <name>():` keyword. A function must be called and executed (for example, by an `if` statement). Functions themselves are objects that can be passed around to other pieces of python code.

* **Indentation**: Python uses the indentation of the code to determine where the code belongs. The colon (:) starts the scope block.

* **Comments**: Done with a # hash character. Enter **command** = **/** to comment out lines in Sublime and VScode.

* **Conditional structures**: Using if, elif, else to evaluate to true or false:

	```
	def main():
	  x, y = 100, 100

	  if (x < y):
	    st = "x is less than y"
	  elif (x == y):
	    st = "x is the same as y"
	  else:
	    st = "x is greater than y"
	  print (st)
	```

* **__init__.py**: A python idiom that declares a python directory to be a package. Do this by putting a `__init__.py` file in the directory.

* The `src` directory. All source code goes here and is bundled inside an artifact. Python test do in a different directory. This way tests are not bundled in with the src artifacts, and the size of those artifacts are not artificially inflated. Most open source projects take this approach. 

* **import statements**: Python has a rich library of pre-defined code that can be imported into my program. It builds functionality into my app. An import statement tells Python where to get this functionality from. For example to manipulate dates and times, you can tell the interpreter to import the `date`, `time`, and `datetime` classes from the `datetime` standard module that comes with python's standard library:

	```
	from datetime import date
	from datetime import time
	from datetime import datetime
	```
* **str()**: This function converts values to a string form so they can be combined with other strings.

  ```
  print("Item exists: " + str(path.exists("textfile.txt")))

  ```

# datetime module

To manipulate dates and times, you can tell the interpreter to import the `date`, `time`, and `datetime` classes from the `datetime` standard module that comes with python's standard library:

```
from datetime import date
from datetime import time
from datetime import datetime
```

### date.today

Call the `today` method on the `date` class to return information about the current date:

```
#!/usr/local/bin/python3

# Import the date, time, and datetime classes from the datetime standard module

from datetime import date
from datetime import time
from datetime import datetime

def main():
  ## DATE OBJECTS
  # Get today's date from the simple today() method from the date class
  mytoday = date.today()
  print("Today's date is", mytoday)


  # The date.today function has many properties associated with it. Print out the date's individual components
  print("Date components: ", mytoday.day, mytoday.month, mytoday.year)

  # The date.today function has many properties associated with it. Print out the date's individual components
  print("Date components: ", mytoday.day, mytoday.month, mytoday.year)

  # retrieve today's weekday (0=Monday, 6=Sunday)
  print ("Today's weekday # is:", mytoday.weekday())
  days = ["mon","tue","wed","thu","fri","sat","sun"]
  print ("Which is a: ", days[mytoday.weekday()])

if __name__ == "__main__":
  main()
```
which prints this:
```
Today's date is 2019-01-03
Date components:  3 1 2019
Today's weekday # is: 3
Which is a:  thu
```

### datetime.now

```
#!/usr/local/bin/python3

# Import the date, time, and datetime classes from the datetime standard module

from datetime import date
from datetime import time
from datetime import datetime

def main():

  ## DATETIME OBJECTS
  # Get today's date from the datetime class
  mytoday = datetime.now()
  print ("The current date and time is ", mytoday)

  # To get the current time, get the time portion of the datetime object. Get the now object from the datetime class and pass it into the time function.
  t = datetime.time(datetime.now())
  print(t)

if __name__ == "__main__":
  main()
```
which prints this:

```
The current date and time is  2019-01-03 14:45:16.963570
14:45:16.967439
```

### now.strftime

Use `now.strftime` to format dates and times.

```
from datetime import datetime

def main():
  # Times and dates can be formatted using a set of predefined string
  # control codes 
  now = datetime.now()

  #### Date Formatting ####
  
  # %y/%Y - Year, %a/%A - weekday, %b/%B - month, %d - day of month
  print(now.strftime("The current year is: %Y"))
  print(now.strftime("%a, %d %B, %y"))


  # %c - locale's date and time, %x - locale's date, %X - locale's time
  print(now.strftime("Locale date and time: %c"))
  print(now.strftime("Locale date: %x"))
  print(now.strftime("Locale time: %X"))


  #### Time Formatting ####

  # %I/%H - 12/24 Hour, %M - minute, %S - second, %p - locale's AM/PM
  print(now.strftime("Current time: %I:%M:%S %p"))
  print(now.strftime("24-hour time: %H:%M"))



if __name__ == "__main__":
  main();
```

which prints this:

```
The current year is: 2019
Sat, 12 January, 19
Locale date and time: Sat Jan 12 15:51:40 2019
Locale date: 01/12/19
Locale time: 15:51:40
Current time: 03:51:40 PM
24-hour time: 15:51
```
# Files

Python knows about files inherently. There's no need to import any class module to work with files. 


```
def main():  
  # Open a file for writing and create it if it doesn't exist
  f = open("textfile.txt", "w+")

  # write some lines of data to the file
  for i in range(10):
    f.write("This is line " + str(i) + "\r\n")
  
  # close the file when done
  f.close()
    
if __name__ == "__main__":
  main()
```

Run the script and go look at the contents of textfile.txt

To append data to an existing file, use the ``a`` attribute (instead of the ``w``):

```
  # Open the file for appending text to the end
  f = open("textfile.txt", "a")
```

# OS Path Utilities

Use the ``os`` module to work with operating system related features, such as gathering information about files. For example, discover if a file exists and its path.

```
# Example file for working with os.path module
#
import os
from os import path
import datetime
from datetime import date, time, timedelta
import time


def main():
  # Print the name of the OS
  print(os.name)

  # Check for item existence and type
  print("Item exists: " + str(path.exists("textfile.txt")))
  print("Item is a file: " + str(path.isfile("textfile.txt")))
  print("Item is a directory: " + str(path.isdir("textfile.txt")))
  
  # Work with file paths
  print("Item path: " + str(path.realpath("textfile.txt")))
  print("Item path and name: " + str(path.split(path.realpath("textfile.txt"))))
  
  # Get the modification time
  t = time.ctime(path.getmtime("textfile.txt"))
  print(t)
  print(datetime.datetime.fromtimestamp(path.getmtime("textfile.txt")))
```
When the above script runs, it prints the following:

```
posix
Item exists: True
Item is a file: True
Item is a directory: False
Item path: /Users/gmcmilla/training/python/Exercise Files/Ch4/textfile.txt
Item path and name: ('/Users/gmcmilla/training/python/Exercise Files/Ch4', 'textfile.txt')
Fri Feb 15 21:40:55 2019
2019-02-15 21:40:55.647603
```

# Internet Data

Use ``urllib.request`` to request a URL and print the HTML:

```
import urllib.request

def main():
  webUrl = urllib.request.urlopen("http://www.google.com")
  print("result code: " + str(webUrl.getcode()))
  data = webUrl.read()
  print(data)

if __name__ == "__main__":
  main()
```

which prints code ``200`` and Google's home page like this:

```
result code: 200
```

# JSON

Python can retrieve JSON data from the Internet (and other sources) and process and manipulate it. 

Note: To learn more about Python's handling capabilities, see https://docs.python.org/3.6/library/json.html

The following example processes the USGS's earthquate JSON data feed from https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php and is based on this training session https://www.linkedin.com/learning/learning-python-2/working-with-json-data?u=104

```
# 
# Example file for parsing and processing JSON
#
import urllib.request 
import json

def printResults(data):
  # Use the json module to load the string data into a dictionary
  theJSON = json.loads(data)
  
  # now we can access the contents of the JSON like any other Python object
  if "title" in theJSON["metadata"]:
    print(theJSON["metadata"]["title"])
  
  # output the number of events, plus the magnitude and each event name  
  count = theJSON["metadata"]["count"]
  print (str(count) + " events recorded")

  # for each event, print the place where it occurred. See the json spec at https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php
  for i in theJSON["features"]:
    print(i["properties"]["place"])
  print("-------------\n")

  # print the events that only have a magnitude greater than 4
  for i in theJSON["features"]:
    if i["properties"]["mag"] >= 4.0:
      print ("%2.1f" % i["properties"]["mag"], i["properties"]["place"])
  print("-------------\n")

  # print only the events where at least 1 person reported feeling something
  print("Events that were felt:")
  for i in theJSON["features"]:
    feltReports = i["properties"]["felt"]
    if feltReports != None:
      if feltReports > 0:
        print ("%2.1f" % i["properties"]["mag"], i["properties"]["place"], " reported " + str(feltReports) + " times")
  
def main():
  # define a variable to hold the source URL
  # In this case we'll use the free data feed from the USGS
  # This feed lists all earthquakes for the last day larger than Mag 2.5
  urlData = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson"

  # Open the URL and read the data
  webUrl = urllib.request.urlopen(urlData)
  print ("result code: " + str(webUrl.getcode()))
  if (webUrl.getcode() ==200):
    data = webUrl.read()
    printResults(data)
  else:
    print("Received error, cannot parse results")

if __name__ == "__main__":
  main()

```

The previous example produced this output:

```
result code: 200
USGS Magnitude 2.5+ Earthquakes, Past Day
44 events recorded
41km WNW of Cantwell, Alaska
93km W of Willow, Alaska
98km WNW of Talkeetna, Alaska
30km NE of Basco, Philippines
109km ENE of Ndoi Island, Fiji
112km ESE of Kitaibaraki, Japan
22km SSW of Gefyra, Greece
Fiji region
176km ENE of Petropavlovsk-Kamchatskiy, Russia
47km NW of Namatanai, Papua New Guinea
19km NW of Anchorage, Alaska
23km NW of Yuto, Argentina
113km NW of Talkeetna, Alaska
114km NW of Talkeetna, Alaska
85km NNE of Arecibo, Puerto Rico
19km NNW of Tehachapi, CA
South Georgia Island region
84km N of Tierras Nuevas Poniente, Puerto Rico
54km N of Isabela, Puerto Rico
171km WSW of El Calafate, Argentina
75km NNE of Punta Cana, Dominican Republic
12km NNW of Otra Banda, Dominican Republic
South of the Fiji Islands
10km S of Kapaau, Hawaii
7km SSW of Yountville, CA
205km SW of Tawui, Indonesia
15km NW of Tela, Honduras
49km NW of San Antonio, Puerto Rico
45km NNE of Otra Banda, Dominican Republic
17km NNW of Anchorage, Alaska
79km NE of Road Town, British Virgin Islands
148km SSW of Lorengau, Papua New Guinea
115km NE of Punta Cana, Dominican Republic
10km SSW of Saiha, India
83km NW of Hirara, Japan
55km N of Brenas, Puerto Rico
14km WSW of Big Lake, Alaska
69km NNW of Ayna, Peru
126km SSE of Cold Bay, Alaska
27km SSE of Londres, Argentina
57km SSW of Kaktovik, Alaska
Southwest Indian Ridge
30km SSW of Fillmore, Utah
177km ENE of Petropavlovsk-Kamchatskiy, Russia
-------------

4.7 30km NE of Basco, Philippines
4.8 109km ENE of Ndoi Island, Fiji
4.8 112km ESE of Kitaibaraki, Japan
4.8 22km SSW of Gefyra, Greece
4.7 Fiji region
4.4 176km ENE of Petropavlovsk-Kamchatskiy, Russia
6.4 47km NW of Namatanai, Papua New Guinea
5.0 23km NW of Yuto, Argentina
5.0 South Georgia Island region
4.3 171km WSW of El Calafate, Argentina
4.6 South of the Fiji Islands
4.2 205km SW of Tawui, Indonesia
4.6 148km SSW of Lorengau, Papua New Guinea
4.8 10km SSW of Saiha, India
5.0 83km NW of Hirara, Japan
4.3 69km NNW of Ayna, Peru
4.3 27km SSE of Londres, Argentina
4.0 57km SSW of Kaktovik, Alaska
4.9 Southwest Indian Ridge
4.5 177km ENE of Petropavlovsk-Kamchatskiy, Russia
-------------

Events that were felt:
2.8 19km NW of Anchorage, Alaska  reported 5 times
3.4 19km NNW of Tehachapi, CA  reported 110 times
3.0 54km N of Isabela, Puerto Rico  reported 1 times
3.1 10km S of Kapaau, Hawaii  reported 84 times
3.7 7km SSW of Yountville, CA  reported 3442 times
3.9 15km NW of Tela, Honduras  reported 14 times
4.8 10km SSW of Saiha, India  reported 21 times
3.0 14km WSW of Big Lake, Alaska  reported 5 times

```

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

## Python3

```
$ brew install python3
```
If you hit this permissions error:

```
==> Pouring python-3.7.2.mojave.bottle.tar.gz
Error: An unexpected error occurred during the `brew link` step
The formula built, but is not symlinked into /usr/local
Permission denied @ dir_s_mkdir - /usr/local/Frameworks
Error: Permission denied @ dir_s_mkdir - /usr/local/Frameworks
```

fix it like this:

```
sudo mkdir /usr/local/Frameworks
sudo chown $(whoami):admin /usr/local/Frameworks 
brew link python3
```
now it's installed:

```
python3 --version
Python 3.7.2
```
See also:
* https://stackoverflow.com/questions/47513024/how-to-fix-permissions-on-home-brew-on-macos-high-sierra/49295044
* https://docs.python-guide.org/starting/install3/osx/#install3-osx

## Python 2

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

# VScode

pythonPath, https://donjayamanne.github.io/pythonVSCodeDocs/docs/python-path/

Enter this in **settings.json** > **WORKSPACE SETTINGS**:

```
{
    "python.pythonPath": "/usr/local/bin/python3"
}
```
A reg squiggle underline means the file has errors.

**Comments**: Done with a # hash character. Use the **command** **/** toggle to comment in/out lines in Sublime and VScode.

# Input Yes/No Program

```
def main():

	print("Do you like my negative ion generator?")
	answer = input()
	if answer == 'yes':
	    print("Thank you!   " * 1)
	elif answer == 'no':
	    print("Sorry you didn't like it ...")

if __name__ == "__main__":
  main()
```

# Raspberry Pi

## Intro

List of Raspberry Pi models: https://www.raspberrypi.org/products/

Where to download an OS for your Raspberry Pi: https://www.raspberrypi.org/downloads/
A link to Etcher (a utility for writing disk images to USB and SD cards): https://www.balena.io/etcher/

The stretch lite package has no Desktop/GUI. Good for CLI only. 

Fun components to buy per Zhao (docin python dev):

* https://www.sparkfun.com/
* https://www.adafruit.com/

## Equipment

https://www.amazon.com/Seenda-Reader-Memory-Function-Micro/dp/B078RKJJCK/ref=sr_1_3?ie=UTF8&qid=1548964333&sr=8-3&keywords=seenda+card+reader

https://www.amazon.com/C4-Labs-Zebra-Wood-Case/dp/B00ME5XUAG/ref=sr_1_1?ie=UTF8&qid=1548964370&sr=8-1&keywords=c4+labs+zebra+wood

https://www.amazon.com/Anker-Premium-Adapter-Ethernet-ChromeBook/dp/B071G83L1J/ref=sr_1_3?ie=UTF8&qid=1548964395&sr=8-3&keywords=anker+usb+c+hub

## OS Upgrades

Manually installing the OS on a SD card. Burn/flash a .img file to the SD card by using the Etcher software www.balena.io

To enable the SSH server on the SD card, create a file named "ssh" in the boot dir:

cd /Volumes/boot
touch ssh

## Boot Setup

A few useful commands for when you first boot up your Raspberry Pi:

Update your software
--------------------
  $ sudo apt update
  $ sudo apt upgrade

Tweak you config (force HDMI to always be active)
-------------------------------------------------
Edit /boot/config.txt and change the following settings:
  hdmi_force_hotplug=1
  hdmi_drive=2

Disable the swap file (to maximize the lifespan of your SD card)
----------------------------------------------------------------
  $ sudo swapoff --all
  $ sudo apt remove dphys-swapfile
  $ sudo rm -f /var/swap

Change your current password
----------------------------
  $ chgpwd

Create a new user
-----------------
  $ sudo adduser admin
(This will create a user called "admin")

Give a user "root" access
------------------------
  $ sudo adduser admin sudo
  $ sudo adduser admin adm
(This will give the "admin" user "root" access / administrator access)

Disable user 'pi'
-----------------
  (You will need to log out of "pi" first, and then log in as another user with "root" access)
  $ sudo passwd -l pi

# Flask

It's a micro web framework powered by Python.

https://realpython.com/introduction-to-flask-part-1-setting-up-a-static-site/


# Resources

## Training

Joe Marini, Python trainer:

Profile: https://www.linkedin.com/learning/instructors/joe-marini?u=104

* Learning Python, https://www.linkedin.com/learning/learning-python-2?u=104
* Advanced Python, https://www.linkedin.com/learning/advanced-python?u=104
* Algorithms, https://www.linkedin.com/learning/programming-foundations-algorithms?u=104

## Other

How namespaces work, https://docs.python.org/3/tutorial/classes.html

https://www.python.org/

Kid basics, http://www.mathandcoding.org/python-course.html

