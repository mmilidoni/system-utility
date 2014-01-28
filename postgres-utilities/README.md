postgres-utilities
==================

Generic utilities for PostgreSQL

postgres-change-owner.py
------------------------

This script changes owner of postgres database. In particular, it changes owner at following db elements:

* database
* schema
* tables
* sequences
* views

Usage: 
```
python postgres-change-owner.py db owner
```
