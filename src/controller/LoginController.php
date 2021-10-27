<?php

class LoginController
{
    
    private $usuarioModel;
    private $log;
    private $printer;
    
    public function __construct($usuarioModel, $logger, $printer)
    {
        $this->usuarioModel = $usuarioModel;
        $this->log = $logger;
        $this->printer = $printer;
    }
    
    function show()
    {
        echo $this->printer->render("view/iniciarSesionView.html");
    }
    
    function login()
    {
        $login = $this->usuarioModel->getUsuario($_POST["email"], md5($_POST["pass"]));
        
        
        //TODO Chequear que el mail este validado
        if ($login) {
            $_SESSION["id"] = $login["id"];
            $_SESSION["nombre"] = $login["nombre"];
            $_SESSION["apellido"] = $login["apellido"];
            $_SESSION["fechaNacimiento"] = $login["fechaNacimiento"];
            $_SESSION["email"] = $login["email"];
            $_SESSION["id_cargo"] = $login["idCargo"];
            $_SESSION["mensaje"]["class"] = "exito";
            $_SESSION["mensaje"]["mensaje"] = "Login correcto";
            header('Location: /');
        } else {
            $_SESSION["mensaje"]["class"] = "error";
            $_SESSION["mensaje"]["mensaje"] = "Usuario o contraseña incorrectos";
            echo $this->printer->render("view/iniciarSesionView.html");
        }
    }
    
    function logout()
    {
        session_destroy();
        session_start();
        $_SESSION["mensaje"]["class"] = "exito";
        $_SESSION["mensaje"]["mensaje"] = "Sesion cerrada";
        header('Location: /');
    }
    
    
}