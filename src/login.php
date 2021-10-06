<?php
$titulo = "Login";
include_once("header.php");
$contenido = "";
if (isset($post_limpio)) {
    
    if (Usuario::realizar_login($mysqli,$post_limpio["user"],$post_limpio["pass"])) {
        header('Location:index.php');
    }
}

$contenido .= '
    <div class="w3-container w3-content w3-padding-16 w3-card w3-animate-top">
        <form class="w3-container w3-white w3-padding-16" action="" method="post">
            <div class="w3-row-padding" style="margin:0 -16px;">
                <div class="w3-half">
                    <label for="user">Email</label>
                    <input name="user" id="user" type="text" class="w3-input w3-border w3-animate-input">
                </div>
                <div class="w3-half">
                    <label for="pass">Contraseña</label>
                    <input name="pass" id="pass" type="password" class="w3-input w3-border w3-animate-input">
                </div>
            </div>
            <p><input type="submit" class="w3-button w3-dark-grey"></p>
            <p>No tenes usuario? <a href="registrarse.php">Registrate!</a></p>
        </form>
    </div>
';

include_once("contenido.php");