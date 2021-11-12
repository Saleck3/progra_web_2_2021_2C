<?php

class VuelosController
{

    private $vuelosModel;
    private $log;
    private $printer;

    public function __construct($logger, $printer, $vuelosModel)
    {
        $this->vuelosModel=$vuelosModel;
        $this->log = $logger;
        $this->printer = $printer;
    }

    function show()
    {
        $data['vuelos']=$this->vuelosModel->getVuelos();

        echo $this->printer->render("view/vuelosView.html",$data);
    }

    function buscar(){


    }

}