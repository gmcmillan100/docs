---
layout: page
title: Mysql
permalink: /mysql/
resource: true
---
Monitor login
-------------
To access the MySQL Remote Monitor, as the user (-u) "mcmillan", call that user's password (-p), then choose the db named "mcmillan":

$ mysql -u mcmillan -p
Enter password: 
$ mysql>


Start/Stop on Mac and Root Login
---------------------------
$ mysql.server start
$ mysql.server stop

Login as root (which is 'guessme'):

$ mysql -u root -p



DB connect file
---------------

vi dbconnect.php

then put this in it:

<?php
// set database server access variables:
$host = "localhost";
$user = "mcmillan";
$pass = "guessm3";
$db = "mcmillan";

// open connection
$connection = mysql_connect($host, $user, $pass) or die ("Unable to connect!");

// select database
mysql_select_db($db) or die ("Unable to select database!");

?>


Sample HTML Form with Call to DB
--------------------------------

vi mysqltest.php

<html>
<body>
<?php

// Connect to db
include('dbconnect.php');

// Launch sql query and store it in $result
$result = mysql_query("SELECT * FROM rooms order by name")
or die(mysql_error());

// Start table
    echo "<table cellpadding=10 border=1>";

// Get number of columns, their names, and put into table heads
$num_fields = mysql_num_fields($result);
echo "<tr>";
for ($i=0; $i < $num_fields; $i++)
{ echo '<th>'.mysql_field_name($result, $i).'</th>'; }
echo "</tr>";

// Fill table rows with data from columns

    while($row = mysql_fetch_array($result)) {

        echo "<tr>";
        echo "<td>".$row['id']."</td>";
        echo "<td>".$row['name']."</td>";
        echo "<td>".$row['building']."</td>";
        echo "<td>".$row['locationcode']."</td>";
        echo "<td>".$row['floor']."</td>";
        echo "<td>".$row['seating']."</td>";
        echo "<td>".$row['capacity']."</td>";
        echo "<td>".$row['bookable']."</td>";
        echo "<td>".$row['roomtype']."</td>";
        echo "<td>".$row['displaytype']."</td>";
        echo "<td>".$row['phone']."</td>";
        echo "<td>".$row['phonetype']."</td>";
        echo "<td>".$row['devicecontrol']."</td>";
        echo "<td>".$row['other']."</td>";
        echo "<td><a href='editroom.php?id=".$row."'>Edit</a></td>";
	echo "</tr>";
    	}
    	echo "</table>";

// free result set memory
mysql_free_result($result);

// close connection
mysql_close($connection);

?>
</body>
</html>


Sample sql queries
------------------
select * from artist;
use music;
select database();
show tables;
show columns from artist;
select * from artist;
select artist_name from artist;
select * from artist where artist_name = "New Order";
select artist_name from artist where artist_id = 4;
select artist_name from artist where artist_id < 'M';
select album_name from album where
    -> album_name > "C" and album_name < "M";
select artist_name, album_name from artist inner join album
    -> using (artist_id);
insert into artist values (7, "Barry Adamson");
delete from played;
update artist set artist_name = upper(artist_name);



Import an entire database from an external file
-----------------------------------------------
mysql> source /Users/gmcmilla/webDev/mysql/music.sql
Query OK, 0 rows affected, 1 warning (0.01 sec)
Query OK, 1 row affected (0.00 sec)
...


GUI mysql management tool
-------------------------
http://dev.mysql.com/downloads/workbench/

1. Start workbench
2. Database > Manage connections > New > name it "local mysql"
2. Connection Method: Local Socket/Pipe (for local db)
3. Test connection
4. Go back to dashboard
5. Database > query database > choose "local mysql" 
6. SQL Editor displays the DBs available





Install
-------

	$ pkg install mysql57-server

which installed these two packages:

	mysql57-server: 5.7.10_3
	mysql57-client: 5.7.10_3

To enable MySQL server as a service, add mysql_enable="YES" to the /etc/rc.conf file.


Start/stop/restart mysql:

	$ service mysql-server start
	$ service mysql-server stop
	$ service mysql-server restart


Initial root login
------------------

	$ mysql -u root -p

Change root's password from inside the interpreter:

	mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('guessm3');

Node.js. See docs/nodejs.

Python connector:
http://stackoverflow.com/questions/372885/how-do-i-connect-to-a-mysql-database-in-python

Ember Data connector:
http://stackoverflow.com/questions/22293741/ember-js-with-mysql-connection



Remember to run mysql_upgrade the first time you start the MySQL server
after an upgrade from an earlier version.

Initial password for first time use of MySQL is saved in $HOME/.mysql_secret
ie. when you want to use "mysql -u root -p" first you should see password
in /root/.mysql_secret
