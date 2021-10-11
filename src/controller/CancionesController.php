<?php

class CancionesController
{
    private $cancionesModel;
    private $log;
    private $printer;

    public function __construct($cancionesModel, $logger, $printer){
        $this->cancionesModel = $cancionesModel;
        $this->log = $logger;
        $this->printer = $printer;
    }

    public function show(){
        $canciones = $this->cancionesModel->getCanciones();

        $this->log->info("Se llamo a canciones");

        $data["canciones"] = $canciones;
        echo $this->printer->render( "view/cancionesView.html" , $data);
    }

    public function description(){
        $cancion = $this->cancionesModel->getCancion($_GET["id"]);

        $data["cancion"] = $cancion;
        echo $this->printer->render( "view/cancionDescriptionView.html" , $data);
    }
}