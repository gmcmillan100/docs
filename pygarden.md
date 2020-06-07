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