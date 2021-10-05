<?php

/**
 * Este es el archivo de coneccion a la base de datos
 * Este archivo tiene que variar segun donde este la base
 */


$hostname_cnx = "localhost";
$database_cnx = "prograweb";
$username_cnx = "root";
$password_cnx = "";

$mysqli = new mysqli($hostname_cnx, $username_cnx, $password_cnx, $database_cnx);
$mysqli->set_charset("utf8");

if ($mysqli->connect_errno) {
    echo "Fallo al conectar a MySQL (MySQLI): (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
