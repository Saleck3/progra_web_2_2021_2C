<?php

$titulo = "Login";
include_once("header.php");
$contenido =
    
    '<div class="w3-container w3-content w3-padding-16 w3-card w3-white w3-animate-top">
        <h4>Para validar su usuario por favor ingrese <a href="validarUsuario.php?code=' . $get_limpio["code"] . '">aqui</a></h4>
    </div>';


include_once("contenido.php");
