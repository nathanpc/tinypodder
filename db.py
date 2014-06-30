#!/usr/bin/env python

# db.py
# Abstracts the database stuff.

import sqlite3

class Database:
    def __init__(self, filename):
        self.db = sqlite3.connect(filename)
