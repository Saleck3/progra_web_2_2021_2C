<?php

class ReportesController
{
    private $printer;
    private $model;
    private $seguridad;
    
    public function __construct($model, $printer, $seguridad)
    {
        $this->printer = $printer;
        $this->model = $model;
        $this->seguridad = $seguridad;
    }
    
    public function show()
    {
        $this->seguridad->estaLogueado($_SESSION["id"], null);
        $data["suborbitales"] = $this->model->getSuborbitales($_SESSION["id"]);
        $data["entre_destinos"] = $this->model->getEntreDestinos($_SESSION["id"]);
        $data["tour"] = $this->model->getTours($_SESSION["id"]);
        echo $this->printer->render("view/misReservasView.html", $data);
    }
}