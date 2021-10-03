<?php

include_once ("header.php");

mensaje_al_usuario("exito", "Se deslogueo el usuario" .$_SESSION["usuario"]->getNombre);
unset($_SESSION["usuario"]);

header('Location:index.php');
