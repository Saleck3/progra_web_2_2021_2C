<?php

class RegistrarmeController
{
    private $usuarioModel;
    private $log;
    private $printer;
    private $mailer;
    
    public function __construct($usuarioModel, $logger, $printer, $mailer)
    {
        $this->usuarioModel = $usuarioModel;
        $this->log = $logger;
        $this->printer = $printer;
        $this->mailer = $mailer;
    }
    
    function show()
    {
        echo $this->printer->render("view/registrarmeView.html");
    }
    
    function registro()
    {
        
        $post_limpio = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
        
        
        if (isset($post_limpio) && isset($post_limpio["mail"])) {
            $codigo = md5(time());
            $post_limpio["codigoValidacion"] = $codigo;
            
            $res = $this->usuarioModel->registrarUsuario($post_limpio);
            var_dump($res);
            if (!is_array($res)) {
                
                $this->mailer->enviarMail($post_limpio["mail"], $post_limpio["Codigo de verificacion de usuario"], "El link de validacion de su usuario es http://localhost:81/registrarme/validacion?codigo=$codigo", $post_limpio["nombre"]);
                
                //TODO Mandar mail
                $_SESSION["mensaje"]["mensaje"] = "Usuario registrado, chequee su casilla de correo para validarlo link = http://localhost:81/registrarme/validacion?codigo=$codigo";
                $_SESSION["mensaje"]["class"] = "exito";
                
                echo $this->printer->render("view/homeView.html");
            } else {
                $_SESSION["mensaje"]["mensaje"] = "Datos incorrectos o el usuario ya existe";
                $_SESSION["mensaje"]["class"] = "error";
                echo $this->printer->render("view/registrarmeView.html");
            }
        } else {
            $_SESSION["mensaje"]["mensaje"] = "Es necesario setear un mail";
            $_SESSION["mensaje"]["class"] = "error";
            echo $this->printer->render("view/registrarmeView.html");
        }
    }
    
    function validacion()
    {
        
        if ($this->usuarioModel->validarUsuario($_GET["codigo"])) {
            
            //TODO Mandar mail
            $_SESSION["mensaje"]["mensaje"] = "El usuario fue validado con exito, ya es posible iniciar sesion";
            $_SESSION["mensaje"]["class"] = "exito";
            
            echo $this->printer->render("view/iniciarSesionView.html");
        } else {
            $_SESSION["mensaje"]["mensaje"] = "Codigo incorrecto";
            $_SESSION["mensaje"]["class"] = "error";
            echo $this->printer->render("view/homeView.html");
        }
        
    }
}