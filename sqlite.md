---
layout: page
title: sqlite
permalink: /sqlite/
resource: true
---

[SQLite](https://www.sqlite.org/index.html) is a C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine. SQLite is the most used database engine in the world. SQLite is built into all mobile phones and most computers and comes bundled inside countless other applications that people use every day.

* [DB Browser](#db-browser)
* [Installation](#installation)
* [Getting Started](#getting-started)
* [Resources](#resources)

# DB Browser

Use [DB Browser for SQLite](https://sqlitebrowser.org/dl/) to edit a sqlite table:

Click on table > Edit > Modify Table > Select field > Ok

See https://stackoverflow.com/questions/805363/how-do-i-rename-a-column-in-a-sqlite-database-table

# Installation

Use BSD's `pkg` utility.

Find the package name:

```
# pkg search sqlite3
sqlite3-3.8.10.2
```

Install it:

```
# pkg install sqlite3-3.8.10.2
Updating FreeBSD repository catalogue...
FreeBSD repository is up-to-date.
All repositories are up-to-date.
Checking integrity... done (0 conflicting)
The following 1 package(s) will be affected (of 0 checked):

New packages to be INSTALLED:
  sqlite3: 3.8.10.2

The process will require 3 MiB more space.

Proceed with this action? [y/N]: y
[1/1] Installing sqlite3-3.8.10.2...
[1/1] Extracting sqlite3-3.8.10.2: 100%
```

Confirm it's installed:

```
# which sqlite3 
/usr/local/bin/sqlite3
```

Display version:

```
# sqlite3 --version
3.8.10.2 2015-05-20 18:17:19 2ef4f3a5b1d1d0c4338f8243d40a2452cc1f7fe4
```

# Getting Started

```
# sqlite3 pygarden.db
SQLite version 3.8.10.2 2015-05-20 18:17:19
Enter ".help" for usage hints.
sqlite>
```

Start the sqlite3 program by typing `sqlite3` at the command prompt, optionally followed by the name the file that holds the SQLite database (or ZIP archive). If the named file does not exist, a new database file with the given name will be created automatically. If no database file is specified on the command-line, a temporary database is created, then deleted when the `sqlite3` program exits.

Enter `.help` for dot commands available.

Check out `.databases`, `.tables`, and more:

```
sqlite> .databases
seq  name             file                                                      
---  ---------------  ----------------------------------------------------------
0    main             /usr/local/www/apache24/data/pygarden.db 
sqlite> .tables
books
sqlite> .schema books
CREATE TABLE "books" (
	"id"	,
	"published"	INT,
	"author"	VARCHAR,
	"title"	VARCHAR,
	"insight"	VARCHAR,
	PRIMARY KEY("id")
);
```

See [Getting Started](https://sqlite.org/cli.html#:~:text=Getting%20Started,-The%20SQLite%20project&text=Start%20the%20sqlite3%20program%20by,name%20will%20be%20created%20automatically.)


# Resources

[Getting Started](https://sqlite.org/cli.html#:~:text=Getting%20Started,-The%20SQLite%20project&text=Start%20the%20sqlite3%20program%20by,name%20will%20be%20created%20automatically.)

[tutorials](https://github.com/sqlitebrowser/sqlitebrowser/wiki/Tutorials)

