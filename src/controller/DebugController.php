<?php

class DebugController
{
    
    private $usuarioModel;
    private $log;
    private $printer;
    
    public function __construct()
    {
    
    }
    
    function show()
    {
        SeguridadController::estaLogueado();
        $_SESSION["debug"] = TRUE;
        $_SESSION["mensaje"]["class"] = "exito";
        $_SESSION["mensaje"]["mensaje"] = "Modo debug iniciado";
        header('Location: /');
    }
    
    function turnOff()
    {
        if (isset($_SESSION["debug"])) {
            unset($_SESSION["debug"]);
        }
        $_SESSION["mensaje"]["class"] = "exito";
        $_SESSION["mensaje"]["mensaje"] = "Modo debug cerrado";
        header('Location: /');
    }
}
