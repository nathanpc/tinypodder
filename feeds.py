#!/usr/bin/env python

# feeds.py
# Manages the feeds.

from db import Database

class Feeds:
    def __init__(self, db_file):
        # Initialize the database object.
        self.db = Database(db_file)
