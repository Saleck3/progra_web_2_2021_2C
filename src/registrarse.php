<?php

$titulo = "Login";
include_once("header.php");
$contenido = "";

if (isset($post_limpio)) {
    if ($codigo = Usuario::registrar($mysqli, $post_limpio["mail"], $post_limpio["pass"], $post_limpio["name"])) {
        header('Location:validar.php?code=' . $codigo);
    }
}

$contenido .=
    
    '<div class="w3-container w3-content w3-padding-16 w3-card w3-animate-top">
        <form class="w3-container w3-white w3-padding-16" action="" method="post">
        <div class="w3-row-padding" style="margin:0 -16px;">
            <label for="name">Nombre</label>
            <input name="name" id="name" type="text" required class="w3-input w3-border w3-animate-input">
            <label for="mail">Email</label>
            <input name="mail" id="mail" type="email" required class="w3-input w3-border w3-animate-input">
            <label for="pass">Contraseña</label>
            <input name="pass" id="pass" type="password" required class="w3-input w3-border w3-animate-input">
            <label for="re_pass">Repetir contraseña</label>
            <input name="re_pass" id="re_pass" type="password" required class="w3-input w3-border w3-animate-input">
      </div>
            <p><input type="submit" class="w3-button w3-dark-grey"></p>
        <p>Ya tenes usuario? <a href="login.php">Inicia sesión!</a></p>
        </form>';


include_once("contenido.php");
