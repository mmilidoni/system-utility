Postgres Utilities
==================

Generic utilities for PostgreSQL

Postgres Change Owner
---------------------

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

