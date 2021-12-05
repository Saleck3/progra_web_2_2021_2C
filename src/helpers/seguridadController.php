<?php

class SeguridadController
{
    
    function estaLogueado($esAdmin = NULL)
    {
        if (!isset($_SESSION["id"])) {
            $_SESSION["mensaje"]["class"] = "error";
            $_SESSION["mensaje"]["mensaje"] = "Debe estar logueado para acceder a esa pagina";
            header('Location: /Login');
            die();
        }
        
        if ($esAdmin && $_SESSION["id_cargo"] != 1) {
            $_SESSION["mensaje"]["class"] = "error";
            $_SESSION["mensaje"]["mensaje"] = "Usted no tiene permiso para acceder a ese sitio";
            header('Location: /');
            die();
            
        }
        
    }
    
}