<?php

class VuelosController
{
    
    private $vuelosModel;
    private $log;
    private $printer;
    
    public function __construct($logger, $printer, $vuelosModel)
    {
        $this->vuelosModel = $vuelosModel;
        $this->log = $logger;
        $this->printer = $printer;
    }
    
    function show()
    {
        $data['vuelos'] = $this->vuelosModel->getVuelos();
        echo $this->printer->render("view/vuelosView.html", $data);
    }
    
    function buscar()
    {
    
    
    }
    
    function suborbital()
    {
        
        var_dump(date('Y-m-n'));
        if (isset($_POST["date"])) {
            $data['diaSeleccionado'] = $_POST["date"];
            $data['vuelos'] = $this->vuelosModel->getVuelosDia($data["diaSeleccionado"]);
            
        } else {
            $data['vuelos'] = $this->vuelosModel->getVuelos();
        }
        
        $data["hoy"] = date('Y-m-n');
        echo $this->printer->render("view/suborbitalView.html", $data);
    }
}