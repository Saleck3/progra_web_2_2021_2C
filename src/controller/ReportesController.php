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
        (new SeguridadController)->estaLogueado();;
        $data["suborbitales"] = $this->model->getSuborbitales($_SESSION["id"]);
        $data["entre_destinos"] = $this->model->getEntreDestinos($_SESSION["id"]);
        $data["tour"] = $this->model->getTours($_SESSION["id"]);
        echo $this->printer->render("view/misReservasView.html", $data);
    }
    
    public function AltaVuelos()
    {
        (new SeguridadController)->estaLogueado(TRUE);
        echo $this->printer->render("view/altaVuelosView.html");
    }
    
    public function ventas()
    {
        (new SeguridadController)->estaLogueado(TRUE);
        echo $this->printer->render("view/reportesView.html");
    }
    
    public function datos()
    {
        (new SeguridadController)->estaLogueado(TRUE);
        $ventas = array(
            'suborbital' => $this->model->countSuborbitales(),
            'tour' => $this->model->countTour(),
            'entreDestinos' => $this->model->countEntreDestinos());
        
        echo json_encode($ventas);
    }
    
    public function datossuborbitalSegunDias()
    {
        $resultado = array();

//        consigo los datos
        $datos = $this->model->getDiasVuelos();
        
        foreach ($datos as $dato) {
            
            $fecha = new DateTime($dato['dia']);
            
            if (!isset($resultado[$fecha->format('d')])) {
                $resultado[$fecha->format('d')] = 0;
            }
            
            $resultado[$fecha->format('d')] += 1;
        }
        
        echo(json_encode($resultado));
        
    }
    
}