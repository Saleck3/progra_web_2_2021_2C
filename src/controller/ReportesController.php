<?php

class ReportesController
{
    private $printer;
    private $model;
    
    public function __construct($model, $printer)
    {
        $this->printer = $printer;
        $this->model = $model;
    }
    
    public function show()
    {
        $data["suborbitales"] = $this->model->getSuborbitales($_SESSION["id"]);
        $data["tour"] = $this->model->getTours($_SESSION["id"]);
        echo $this->printer->render("view/misReservasView.html", $data);
    }
}