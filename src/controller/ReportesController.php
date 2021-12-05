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
        $data["entre_destinos"] = $this->model->getEntreDestinos($_SESSION["id"]);
        $data["tour"] = $this->model->getTours($_SESSION["id"]);
        echo $this->printer->render("view/misReservasView.html", $data);
    }
    
    public function AltaVuelos()
    {
        SeguridadController::estaLogueado(TRUE);
        echo $this->printer->render("view/altaVuelosView.html");
    }
    
    public function ventas()
    {
        SeguridadController::estaLogueado(TRUE);
        echo $this->printer->render("view/reportesView.html");
    }
    
    public function datos()
    {
        SeguridadController::estaLogueado(TRUE);
        $ventas = array(
            'suborbital' => $this->model->countSuborbitales(),
            'tour' => $this->model->countTour(),
            'entreDestinos' => $this->model->countEntreDestinos());
        
        echo json_encode($ventas);
    }
    
}