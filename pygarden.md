---
layout: page
title: PyGarden
permalink: /pygarden/
resource: true
---
PyGarden is a Python Spiritual Garden. It's the place where God teaches about life through activities in the garden.

PyGarden is a backend service that is REST API enabled.

Tutorial, https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask

# Pre-reqs

Python
Flask


# Create flask app

Add this to a file named `api.py`:

```
import flask

app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/', methods=['GET'])
def home():
    return "<h1>Welcome to PyGarden</h1><p>A prototype API for magic in the garden.</p>"

app.run()
```

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