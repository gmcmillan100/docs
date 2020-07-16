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
* [Create flask app](#create-flask-app)
* [Create the api](#creating-the-api)
* [SQLite database](#sqlite-database)
* [API examples](#api-examples)
* [Deployment](#deployment)
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

* [Python](https://www.python.org/)
* [Flask](https://palletsprojects.com/p/flask/)
* [SQLite](https://www.sqlite.org/index.html)
* Search

# Create the basic flask app

Add this to a file named `pygarden.py`:

```
import flask

app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/', methods=['GET'])
def home():
    return "<h1>Welcome to PyGarden</h1><p>A prototype API for magic in the garden.</p>"

app.run()
```

Define an `@app.route` listening at the root our app and execute a view function called home(). @app.route("/") is a Python decorator that Flask provides to assign URLs in our app to functions easily. See [flask routes](https://hackersandslackers.com/flask-routes).

https://hackersandslackers.com/your-first-flask-application

Start the Flask app:

```
$ python api.py
 * Serving Flask app "api" (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 887-258-551
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


# API examples

curl http://127.0.0.1:5000/api/v1/resources/books/all

# Deployment

Our production enviornment is running FreeBSD

1. install flask on server, http://www.michielovertoom.com/freebsd/flask-gunicorn-nginx-supervisord/#:~:text=Flask%20and%20the%20web%20application,%2Fwww%2Fpy%2Dflask.

2. install sqlite, https://www.osradar.com/how-to-install-sqlite-on-freebsd-12/

3. Configure mod_wsgi (Apache), https://flask.palletsprojects.com/en/1.1.x/deploying/mod_wsgi/

http://www.michielovertoom.com/freebsd/flask-gunicorn-nginx-supervisord/#:~:text=Flask%20and%20the%20web%20application,%2Fwww%2Fpy%2Dflask.

See also https://flask.palletsprojects.com/en/1.1.x/deploying/#deployment

# Resources

Tutorial, https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask
