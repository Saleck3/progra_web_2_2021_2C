<?php
//Sanitizo inputs
$get_limpio = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
$post_limpio = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
session_start();
include_once("cnx/coneccion.php");
include_once("funciones.php");
include_once("Usuario.php");
