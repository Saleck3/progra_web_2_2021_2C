<?php

$hostname_cnx = "mysql";
$database_cnx = "prograweb";
$username_cnx = "root";
$password_cnx = "rootpassword";

$mysqli = new mysqli($hostname_cnx, $username_cnx, $password_cnx, $database_cnx);
$mysqli->set_charset("utf8");

if ($mysqli->connect_errno) {
    echo "Fallo al conectar a MySQL (MySQLI): (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
