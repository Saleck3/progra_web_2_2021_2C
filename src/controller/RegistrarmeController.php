<?php

class RegistrarmeController
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
        echo $this->printer->render("view/registrarmeView.html");
    }
    
    function registro()
    {
        
        $post_limpio = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
        
        
        if (isset($post_limpio) && isset($post_limpio["mail"])) {
            if ($this->usuarioModel->registrarUsuario($post_limpio)) {
                $data["mensaje"] = "Usuario registrado";
                $data["class"] = "exito";
                
                echo $this->printer->render("view/homeView.html", $data);
            } else {
                $data["mensaje"] = "Error de conexion a la base de datos o datos incorrectos";
                $data["class"] = "error";
                echo $this->printer->render("view/registrarmeView.html", $data);
            }
        } else {
            $data["mensaje"] = "Es necesario setear un mail";
            $data["class"] = "error";
            echo $this->printer->render("view/registrarmeView.html", $data);
        }
    }
}