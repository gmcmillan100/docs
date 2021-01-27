---
layout: page
title: pyGarden
permalink: /pygarden/
resource: true
---

* [Background](#background)
* [End-User Requirements](#end-user-requirements)
* [Design Specification](#design-specification)
* [Pre-reqs](#pre-reqs)
* [REST API design](#rest-api-design)
* [Create the basic Flask app](#create-the-basic-flask-app)
* [Start the Flask app and test it](#start-the-flask-app-and-test-it)
* [SQLite database](#sqlite-database)
* [Create APIs](#create-apis)
* [Deployment](#deployment)
* [Service Bringup](#service-bringup)
* [Testing](#testing)
* [Resources](#resources)

# Background

Python Garden (pyGarden) is a spiritual and magical place where God inspires me through nature. See the [demo](https://www.youtube.com/watch?v=23L0WEWArSo&feature=youtu.be).

![](../images/pygarden.png)

Each morning, I sit in the garden, meditate on scripture, reflect on life, sing, pray, and make decisions. Here, I find love, strength, peace, and serenity. I learn to let go of fear, worry, and anxiety.

God shows me the life cycle where plants grow, reproduce, die, and rise to live again.

I gain insights in the pyGarden. For example, one carrot flower is a seed pod, containing 100s of seeds. God teaches me that he likes multiplication and reproduction for the next generation. God thinks big. He is not small minded and neither should I be in the way I live my life.

Here, each living cell in my body receives nutritious super foods from God. He is the hand that feeds me, all organic, heirloom, without a hint of genetic modification. I am whole and complete with each tasty mouthful.

I leap for joy receiving free food. I gather the seeds each year and replant them, costing me nothing to grow. Only my time and labor of love are required.

PyGarden is a homestead that provides for my family. It safeguards us from a breakdown of the food supply chain in a credit crisis or civil unrest crisis.

I learn about life cycles and healing principles through observing miracles and wonders in my backyard garden.

PyGarden has inspired me to code a backend app for journaling meaningful experiences and insights . It's a REST API backend service that uses a SQLite database.

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

## Database structure

The `books` table will have these columns:

```
id
author
title
insight
published
```

as shown in the [DB Browser for SQLite](https://sqlitebrowser.org/):

![](../images/sqldb-browser.png)


## Tools

* [Python](https://www.python.org/) for the programming language
* [Flask](https://palletsprojects.com/p/flask/) for the web framework
* [SQLite](https://www.sqlite.org/index.html) for the database
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

The `import` statement invokes the import machinery. The basic import statement (no `from` clause) is executed in two steps:

1. Find the module, load it, and initialize

2. Define a name or names in the local namespace for the scope where the import statement occurs.

When the statement contains multiple clauses (separated by commas) the two steps are carried out separately for each clause, just as though the clauses had been separated out into individual import statements.

`import flask` -- Imports the Flask library, making the code available to the rest of the application.

`from flask import request, jsonify` -- Flask provides a jsonify function that allows us to convert lists and dictionaries to [JSON format](https://www.json.org/). Find the module specified in the from clause, then load and initialize it.

`import sqlite3` -- Imports the [SQLlite3](/docs/sqlite/) library.

`app = flask.Flask(__name__)` -- Creates the Flask application object. It contains data about the application and methods (object functions) that tell the application to do certain actions. The last line, `app.run()`, is one such method.

`app.config["DEBUG"] = True` -- Starts the debugger. With this line, if code is malformed, an error is displayed when the app is visited. Otherwise, only a generic message such as `Bad Gateway` is displayed in the browser when there’s a problem with the code.

`@app.route('/', methods=['GET'])` -- Flask maps HTTP requests to Python functions. The @app.route decorator creates an association between the URL given as an argument and the function. When a web browser requests the URL (/), Flask invokes this function and passes the return value of it back to the browser as a response.

In this case, the URL path (`/`) is mapped to the function `home`. When the client connects to the Flask server at `http://10.0.0.176:5000/`, Flask checks if there is a match between the path provided and a defined function. Since /, or no additional provided path, has been mapped to the home function, Flask runs the code in the function and displays the returned result in the browser. In this case, the returned result is HTML markup for a home page welcoming visitors to the site hosting our API. The process of mapping URLs to functions is called [routing](https://hackersandslackers.com/series/build-flask-apps/).

The methods list `methods=['GET']` is a keyword argument that lets Flask know what kind of HTTP requests are allowed.

`app.run()` -- Method that runs the application server.

# Start the Flask app and test it

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

2. From a web client, go to the URL at `http://10.0.0.176:5000/`. The Flask server binds to port 5000 by default.

3. From the server, monitor the activity in the terminal:

    ```
    10.0.0.155 - - [06/Sep/2020 06:29:16] "GET / HTTP/1.1" 200 -
    10.0.0.155 - - [06/Sep/2020 06:29:17] "GET /favicon.ico HTTP/1.1" 404 -
    ```

# SQLite database

The API serves data that is stored in a [SQLite database](/docs/sqlite/) (`pygarden.db`). When the client requests an entry or set of entries, the API pulls that information from the database by building and executing an SQL query.

Relational databases allow for the storage and retrieval of data, which is stored in tables. Tables are similar to spread sheets in that they have columns and rows—columns indicate what the data representes, such as “title” or “date.” Rows represent individual entries, which could be books, users, transactions, or any other kind of entity.

The database we’re working with has five columns `id`, `published`, `author`, `title`, and `insight`. Each row represents one document, describing an insight.

Connect to the database using the `sqlite3` library:

```
import sqlite3
```

Create a `dict_factory` function to loop over each column and row in the table. It returns items from the database as dictionaries rather than lists; these work better when we output to JSON:

```
def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d
```

Under each API route, specify DB connector, DB file, and select statement:

```
@app.route('/api/v1/resources/doc/all', methods=['GET'])
def api_all():
    conn = sqlite3.connect('pygarden.db')
    conn.row_factory = dict_factory
    cur = conn.cursor()
    all_books = cur.execute('SELECT * FROM books;').fetchall()

    return jsonify(all_books)
```

An object representing the connection to the database is bound to the `conn` variable. The `conn.row_factory = dict_factory` line lets the connection object know to use the `dict_factory` function we’ve defined. We then create a cursor object `cur = conn.cursor()`, which is the object that actually moves through the database to pull our data. Finally, we execute an SQL query with the `cur.execute` method to pull out all available data (`*`) from the books table of our database. At the end of our function, this data is returned as JSON: `jsonify(all_books)`. 

The `api_all` function pulls in data from the database. Note that our other function that returns data, `api_filter`, will use a similar approach to pull data from the database.

# Create APIs

## GET: resources/doc

The `resources/doc` endpoint returns articles. You can configure it with options such as:

* Title ID assigned to the article
* Year the article was published
* Author who wrote the article

Syntax query parameters:

```
resources/doc [ id<value> | published=<year> | author="<name>" ]
```
It's required that you specify at least one parameter. 

Configuration:

```
@app.route('/api/v1/resources/doc', methods=['GET'])
def api_filter():
    query_parameters = request.args

    id = query_parameters.get('id')
    published = query_parameters.get('published')
    author = query_parameters.get('author')

    query = "SELECT * FROM books WHERE"
    to_filter = []

    if id:
        query += ' id=? AND'
        to_filter.append(id)
    if published:
        query += ' published=? AND'
        to_filter.append(published)
    if author:
        query += ' author=? AND'
        to_filter.append(author)
    if not (id or published or author):
        return page_not_found(404)

    query = query[:-4] + ';'

    conn = sqlite3.connect('pygarden.db')
    conn.row_factory = dict_factory
    cur = conn.cursor()

    results = cur.execute(query, to_filter).fetchall()

    return jsonify(results)
```

GET examples and responses:

```
$ curl http://10.0.0.176:5000/api/v1/resources/doc?author=Greg+McMillan
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

```
$ curl http://10.0.0.176:5000/api/v1/resources/doc?id=1
[
  {
    "author": "Greg McMillan", 
    "id": "1", 
    "insight": "1 flower, 100s of seeds from 1 seed, think big because God does, multiplication not addition, God makes it grow", 
    "published": 2020, 
    "title": "Carrot seed flowers bloom my life"
  }
]

```

## GET: resources/doc/all

The `resources/doc/all` endpoint returns all the articles stored in the system. 

Syntax query parameters:

```
resources/doc/all
```

Configuration:

```
@app.route('/api/v1/resources/doc/all', methods=['GET'])
def api_all():
    conn = sqlite3.connect('pygarden.db')
    conn.row_factory = dict_factory
    cur = conn.cursor()
    all_books = cur.execute('SELECT * FROM books;').fetchall()

    return jsonify(all_books)
```

GET example and response:

```
$ curl http://10.0.0.176:5000/api/v1/resources/doc/all
[
  {
    "author": "Ann Leckie ", 
    "id": null, 
    "insight": "The yellow body lay naked and facedown, a deathly gray, spatters of blood staining the snow around it.", 
    "published": 2014, 
    "title": "Ancillary Justice"
  }, 
  ...
```

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

Try sending the GET request using [Postman](https://www.postman.com/):

![](../images/postman.png)

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

https://hackersandslackers.com/series/build-flask-apps/

https://hackersandslackers.com/your-first-flask-application

Tutorial, https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask
