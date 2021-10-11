<?php

class QuieroSerParteController{

    private $printer;

    public function __construct($printer){
        $this->printer = $printer;
    }

    function show(){
        echo $this->printer->render("view/quieroSerParteView.html");
    }

    function procesarFormulario(){
        $data["nombre"] = $_POST["nombre"];
        $data["instrumento"] =  $_POST["instrumento"];

        echo $this->printer->render("view/quiereSerParteView.html", $data);
    }

}