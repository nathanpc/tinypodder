#!/usr/bin/env python

# tinypodder.py
# A lightweight podcast manager.

import os
import flask

from feeds import Feeds

# Initialize a Flask object.
app = flask.Flask(__name__)
app.config.from_object(__name__)
app.config.update(dict(
    DATABASE = os.path.join(app.root_path, "tinypodder.db"),
    DEBUG = True))

# Initialize the feeds.
feeds = Feeds(app.config["DATABASE"])

# Define the webapp home.
@app.route("/")
def home():
    return "Hello, World!"

# Start the webapp.
#if __name__ == "__main__":
    #app.run()
