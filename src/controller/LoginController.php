<?php

class LoginController{

    private $usuarioModel;
    private $log;
    private $printer;

    public function __construct($usuarioModel, $logger, $printer){
        $this->usuarioModel = $usuarioModel;
        $this->log = $logger;
        $this->printer = $printer;
    }

    function show(){
        echo $this->printer->render("view/iniciarSesion.html");
    }

    function login(){
        $data["email"] = $_POST["email"];
        $data["pass"] = $_POST["pass"];

        $login = $this-> usuarioModel->getUsuario($_POST["email"],md5($_POST["pass"]));

        // echo $this->printer->render("view/iniciarSesion.html", $data);
        print_r ($login);
        exit();
    }

    function procesarFormulario(){
        $data["nombre"] = $_POST["nombre"];
        $data["instrumento"] =  $_POST["instrumento"];

        echo $this->printer->render("view/iniciarSesion.html", $data);
    }

}