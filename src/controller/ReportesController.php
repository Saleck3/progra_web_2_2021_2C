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

    public function AltaVuelos(){

        echo $this->printer->render("view/altaVuelosView.html");
    }
//
//    public function registrarVuelo(){
//        $data["fecha"] = $_POST["fecha"];
//        $data["hora"] = $_POST["hora"];
//        $data["partida"] = $_POST["partida"];
//        $data["destino"] = $_POST["destino"];
//        $data["duracion"] = $_POST["duracion"];
//        $data["matricula"] = $_POST["matricula"];
//            var_dump($data);
//        if ($this->VuelosModel->registrarVueloEntreDestinos($data)) {
//            $_SESSION["mensaje"]["class"] = "exito";
//            $_SESSION["mensaje"]["mensaje"] = "Vuelo creado con exito";
//            header('Location: /');
//        } else {
//            $_SESSION["mensaje"]["class"] = "error";
//            $_SESSION["mensaje"]["mensaje"] = "Error al crear vuelo";
//
//            echo $this->printer->render("view/altaVuelosView.html");
//        }
//    }
}