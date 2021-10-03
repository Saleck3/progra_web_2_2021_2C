<?php
$titulo = "Login";
include_once("header.php");
$contenido = "";
if (isset($post_limpio)) {
    
    $user = new Usuario($post_limpio["user"], $post_limpio["pass"]);
    
    if ($user->realizar_login($mysqli)) {
        header('Location:index.php');
    }
}

$contenido .=
    '<article class="w3-container">
        <form class="w3-container" action="login.php" method="post">
            <label for="user">Email</label>
            <input name="user" id="user" type="text" class="w3-input">
            <label for="pass">Contraseña</label>
            <input name="pass" id="pass" type="password" class="w3-input">
            <input type="submit" class="w3-input">
        </form>
    </article>';

include_once("contenido.php");