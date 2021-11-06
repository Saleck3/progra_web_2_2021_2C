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
        
        
        if ($login) {
            if ($login["codigoValidacion"]) {
                $_SESSION["mensaje"]["class"] = "error";
                $_SESSION["mensaje"]["mensaje"] = "El usuario no esta validado, asegurese de chequear su mail para validarlo";
                echo $this->printer->render("view/iniciarSesionView.html");
            } else {
                $_SESSION["id"] = $login["id"];
                $_SESSION["nombre"] = $login["nombre"];
                $_SESSION["apellido"] = $login["apellido"];
                $_SESSION["fechaNacimiento"] = $login["fechaNacimiento"];
                $_SESSION["email"] = $login["email"];
                $_SESSION["id_cargo"] = $login["idCargo"];
                $_SESSION["mensaje"]["class"] = "exito";
                $_SESSION["mensaje"]["mensaje"] = "Login correcto";
                header('Location: /');
            }
        } else {
            $_SESSION["mensaje"]["class"] = "error";
            $_SESSION["mensaje"]["mensaje"] = "Usuario o contraseña incorrectos";
            echo $this->printer->render("view/iniciarSesionView.html");
        }
    }
    
    function logout()
    {
        if (isset($_SESSION["debug"])) {
            $flag = TRUE;
        }
        session_destroy();
        session_start();
        
        if ($flag) {
            $_SESSION["debug"] = TRUE;
        }
        
        $_SESSION["mensaje"]["class"] = "exito";
        $_SESSION["mensaje"]["mensaje"] = "Sesion cerrada";
        header('Location: /');
    }
    
    
}