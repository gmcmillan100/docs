---
layout: page
title: pyGarden
permalink: /pygarden/
resource: true
---
Spiritual Python Garden is a magical place where God inspires me. I learn about life cycles and healing principles through observing miracles and wonders in my backyard garden.

PyGarden is a backend service. It is REST API enabled and uses an SQLite database.

* [End-User Requirements](#end-user-requirements)
* [Design Specification](#design-specification)
* [Pre-reqs](#pre-reqs)
* [REST API design](#rest-api-design)
* [Create the basic Flask app](#create-the-basic-flask-app)
* [Start the Flask app](#start-the-flask-app)
* [Create the api](#creating-the-api)
* [SQLite database](#sqlite-database)
* [Deployment](#deployment)
* [Service Bringup](#service-bringup)
* [Testing](#testing)
* [Resources](#resources)

# End-User Requirements

- Read and write special moments in the garden
- Text descriptions and photos
- Store data 
- Use CLI with curl for APIs
- Use a mobile Web UI with Chrome
- Data backup for disaster recovery
- Easy to demo during a job interview

# Design Specification

## REST APIs

The prevailing design philosophy of modern APIs is called REST. For PyGarden's purposes, the most important thing about REST is that it’s based on the four methods defined by the HTTP protocol: 

```
POST, GET, PUT, DELETE
```

These correspond to the four traditional actions performed on data in a database: 

```
CREATE, READ, UPDATE, DELETE
```

Requests to the API will follow this pattern:

```
https://api.pygarden.com/v1/resources/doc?id=10
https://api.pygarden.com/v1/resources/images?id=10
https://api.pygarden.com/v1/resources/all
```

`api.pygarden.com` -- Domain name

`v1` -- API version number to support future versions and backward compatibility

`resources` -- Plan to support resources or non-resource functionality to the API in the future:

- `doc` -- Document resource
- `images` -- Images resource
- `all` -- All resource

The query parameters follow the `?` in the request, and are seperated from one another by the `&` symbol:

- `id=<value>` -- The ID of the document
- `published=<value>` -- The published data of the document
- `author=<value>` -- The author of the document

# Database structure

The `books` table will have these columns:

```
id
author
title
insight
published
```
## Tools

* [Python](https://www.python.org/) is the programming language.
* [Flask](https://palletsprojects.com/p/flask/) for the web framework.
* [SQLite](https://www.sqlite.org/index.html) for the database.
* Search

# Create the basic flask app

[Flask](/docs/flask/) provides the web framework for Python, including managing HTTP requests and APIs.

Create a file named `pygarden.py` and add this to it.

```
import flask
from flask import request, jsonify
import sqlite3

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/', methods=['GET'])
def home():
    return '''<h1>Spiritual pyGarden</h1>
<p>Spiritual Python Garden is the magical place where God inspires me. I learn about life cycles and healing principles through observing miracles and wonders in my backyard garden.</p>'''

app.run()
```

The `import` statement is the most common way of invoking the import machinery. The basic import statement (no `from` clause) is executed in two steps:

1. Find a module, load and initialize it

2. Define a name or names in the local namespace for the scope where the import statement occurs.

When the statement contains multiple clauses (separated by commas) the two steps are carried out separately for each clause, just as though the clauses had been separated out into individual import statements.

`import flask` -- Imports the Flask library, making the code available to the rest of the application.

`from flask import request, jsonify` -- Flask provides a jsonify function that allows us to convert lists and dictionaries to [JSON format](https://www.json.org/). Find the module specified in the from clause, then load and initialize it.

`import sqlite3` -- Imports the [SQLlite3](/docs/sqlite/) library.

`app = flask.Flask(__name__)` -- Creates the Flask application object. It contains data about the application and also methods (object functions) that tell the application to do certain actions. The last line, `app.run()`, is one such method.

`app.config["DEBUG"] = True` -- Starts the debugger. With this line, if my code is malformed, I’ll see an error when I visit my app. Otherwise, only a generic message such as `Bad Gateway` is displayed in the browser when there’s a problem with my code.

```
@app.route('/', methods=['GET'])
def home():
    return '''<h1>Spiritual pyGarden</h1>
<p></p>'''''
```

Flask maps HTTP requests to Python functions. The @app.route decorator creates an association between the URL given as an argument and the function. When a web browser requests the URL (/), Flask is going to invoke this function and pass the return value of it back to the browser as a response.

 In this case, we’ve mapped one URL path (`/`) to one function, `home`. When we connect to the Flask server at http://127.0.0.1:5000/, Flask checks if there is a match between the path provided and a defined function. Since /, or no additional provided path, has been mapped to the home function, Flask runs the code in the function and displays the returned result in the browser. In this case, the returned result is HTML markup for a home page welcoming visitors to the site hosting our API. The process of mapping URLs to functions is called [routing](https://hackersandslackers.com/flask-routes). 

The methods list `methods=['GET']` is a keyword argument that lets Flask know what kind of HTTP requests are allowed. We'll add POST requests (to receive data from a user) later.

`app.run()` -- Method that runs the application server.

# Start the Flask app

1. Issue `python pygarden.py`:

```
$ python pygarden.py 
 * Serving Flask app "pygarden" (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on http://10.0.0.176:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 337-146-323
```

2. Go to the URL.

3. Access activity is displayed in the terminal:

```
10.0.0.155 - - [06/Sep/2020 06:29:16] "GET / HTTP/1.1" 200 -
10.0.0.155 - - [06/Sep/2020 06:29:17] "GET /favicon.ico HTTP/1.1" 404 -
```

# Creating the API

```
import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

# Create some test data for our catalog in the form of a list of dictionaries.
books = [
    {'id': 0,
     'title': 'Carrot seeds',
     'author': 'Greg McMillan',
     'first_sentence': 'Each flower produces 100s of seeds. Harvest when brown.',
     'scripture': 'Pr 3:18',
     'year_published': 'June 2020'},
    {'id': 1,
     'title': 'Beet seeds',
     'author': 'Greg McMillan',
     'first_sentence': 'Harvest when large and brown.',
     'scripture': 'Isa 51:3',
     'published': 'June 2020'},
    {'id': 2,
     'title': 'Reproduction: The circle of life',
     'author': 'Greg McMillan',
     'first_sentence': 'Grow, seed, fall, die, repeat',
     'scripture': 'Jn 12:24',
     'published': 'June 2020'}
]


@app.route('/', methods=['GET'])
def home():
    return "<h1>Welcome to PyGarden</h1><p>A prototype API for magic in the garden.</p>"

# A route to return all of the available entries in our catalog.
@app.route('/api/v1/resources/books/all', methods=['GET'])
def api_all():
    return jsonify(books)


app.run()
```

Visit the API to test:

http://127.0.0.1:5000/api/v1/resources/books/all

# SQLite database

The API serves results that are stored in an SQLite database (books.db). 

When the user requests an entry or set of entries, the API pulls that information from the database by building and executing an SQL query.

# Deployment

Release 1.0 supports read-only GET requests using REST APIs.

## System limitations

My BSD is running an old OS version:

```
# uname -a
FreeBSD bsd 10.2-RELEASE FreeBSD 10.2-RELEASE #0: Thu Feb 25 15:49:12 PST 2016     greg@bsd:/usr/obj/usr/src/sys/GREGKERNEL  i386
```

With an old version of the `pkg` package manager:

```
# pkg info pkg-1.5.4
pkg-1.5.4
Name           : pkg
Version        : 1.5.4
```

## BSD package install

Release 1.0 is required to work on the existing system.

The OS and its available packages supported the following:

```
pkg install python27-2.7.9_1
pkg install py27-sqlite3-2.7.9_6
pip install flask
```

The special binary `py27-sqlite3-2.7.9_6` was a required standard Python binding to the SQLite3 library. Without it, the setup didn't work.


```
# pip list
DEPRECATION: Python 2.7 reached the end of its life on January 1st, 2020. Please upgrade your Python as Python 2.7 is no longer maintained. pip 21.0 will drop support for Python 2.7 in January 2021. More details about Python 2 support in pip, can be found at https://pip.pypa.io/en/latest/development/release-process/#python-2-support
Package      Version
------------ -------
-sqlite3     0.0.0
click        7.1.2
Flask        1.1.2
itsdangerous 1.1.0
Jinja2       2.11.2
MarkupSafe   1.1.1
pip          20.2b1
setuptools   17.0
Werkzeug     1.0.1
```

```
# pkg info
apache24-2.4.16                Version 2.4.x of Apache web server
...
pkg-1.5.4                      Package manager
py27-setuptools27-17.0         Python packages installer
py27-sqlite3-2.7.9_6           Standard Python binding to the SQLite3 library
python27-2.7.9_1               Interpreted object-oriented programming language
```

Note. I attempted installing Python 3 and SQLlite3, but it didn't work. There were package version conflicts, and the ports under `/usr/ports/databases/py-sqlite3` would not `make install`. Next step is to do a full OS upgrade. Additionally, BSD's `python3.4` was not compiled with sqlite3 and thus would not import, producing `ImportError: No module named _sqlite3` . See [article](https://forums.freebsd.org/threads/sqlite3-on-python3-fails.53114/).

```
# python3.4
Python 3.4.3 (default, Jul 30 2015, 01:22:16) 
[GCC 4.2.1 Compatible FreeBSD Clang 3.4.1 (tags/RELEASE_34/dot1-final 208032)] on freebsd10
Type "help", "copyright", "credits" or "license" for more information.
>>> import sqlite3
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/local/lib/python3.4/sqlite3/__init__.py", line 23, in <module>
    from sqlite3.dbapi2 import *
  File "/usr/local/lib/python3.4/sqlite3/dbapi2.py", line 27, in <module>
    from _sqlite3 import *
ImportError: No module named '_sqlite3'
>>> 
```

## App Run on Host IP

In api.py, set the `host` to the IP address of the machine to run the web application on:

```
app.run(host="10.0.0.176")
```

# Service bringup

These service files exist in the Apache root:

```
pygarden.py
pygarden.db
```

`pygarden.py` is the Flask app. `pygarden.db` is the Sqlite3 database that is imported by the Flask app on startup.

Go to the Apache root:

```
cd /usr/local/www/apache24/data
```

Start the Flask app:

```
# python pygarden.py
 * Serving Flask app "pygarden" (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on http://10.0.0.176:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 337-146-323
```

# Testing

Send a GET request to http://SERVER:5000/.

Test with curl:

```
$ curl http://10.0.0.176:5000/api/v1/resources/doc?published=2020
[
  {
    "author": "Greg McMillan", 
    "id": null, 
    "insight": "1 flower, 100s of seeds, think big because God makes it grow", 
    "published": 2020, 
    "title": "Carrot seed flowers bloom my life"
  }
]
```

When successful, it produces a status 200 notification on the Flask server:

```
10.0.0.155 - - [01/Aug/2020 11:26:21] "GET /api/v1/resources/doc?published=2020 HTTP/1.1" 200 -
```

Get all docs:

```
curl http://10.0.0.176:5000/api/v1/resources/doc/all
```

## Production scalable

Our production enviornment is running FreeBSD

1. install flask on server, http://www.michielovertoom.com/freebsd/flask-gunicorn-nginx-supervisord/#:~:text=Flask%20and%20the%20web%20application,%2Fwww%2Fpy%2Dflask.

2. install sqlite, https://www.osradar.com/how-to-install-sqlite-on-freebsd-12/

3. Configure mod_wsgi (Apache), https://flask.palletsprojects.com/en/1.1.x/deploying/mod_wsgi/

http://www.michielovertoom.com/freebsd/flask-gunicorn-nginx-supervisord/#:~:text=Flask%20and%20the%20web%20application,%2Fwww%2Fpy%2Dflask.

See also https://flask.palletsprojects.com/en/1.1.x/deploying/#deployment

# Resources

https://hackersandslackers.com/your-first-flask-application

Tutorial, https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask
