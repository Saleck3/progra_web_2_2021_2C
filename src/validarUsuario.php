<?php

$titulo = "Login";
include_once("header.php");
$contenido = "";

if ($get_limpio["code"]) {
    
    
    if ($get_limpio["code"] == "success") {
        mensaje_al_usuario("exito", "Usuario validado, ya puede iniciar sesion");
    } else if (Usuario::validar($mysqli, $get_limpio["code"])) {
        mensaje_al_usuario("exito", "Usuario validado, ya puede iniciar sesion");
        header('Location:validarUsuario.php?code=success');
    } else {
        $contenido .=
            '<div class="w3-container w3-content w3-padding-16 w3-card w3-white w3-animate-top">
            <h4>Error de codigo</h4>
            </div>';
    }
} else {
    $contenido .=
        '<div class="w3-container w3-content w3-padding-16 w3-card w3-white w3-animate-top">
        <h4>Se debe especificar un codigo</h4>
    </div>';
}


include_once("contenido.php");
