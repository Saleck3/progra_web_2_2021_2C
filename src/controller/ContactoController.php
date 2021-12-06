<?php

class ContactoController
{
    private $usuarioModel;
    private $log;
    private $printer;


    public function __construct($usuarioModel, $logger, $printer )
    {
        $this->usuarioModel = $usuarioModel;
        $this->log = $logger;
        $this->printer = $printer;

    }


    public function show(){

        echo $this->printer->render("view/contactoView.html");
    }
}