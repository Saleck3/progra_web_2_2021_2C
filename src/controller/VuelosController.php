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
        $data["hoy"] = date('Y-m-d');
        if (isset($_POST["date"])) {
            $data['diaSeleccionado'] = $_POST["date"];
            $data['vuelos'] = $this->vuelosModel->getVuelosDia($data["diaSeleccionado"]);
            $this->agregarDia($data['vuelos'], $data["diaSeleccionado"]);
        } else {
            $data['vuelos'] = $this->vuelosModel->getVuelos();
            $this->agregarDia($data['vuelos'], $data["hoy"], TRUE);
        }
        echo $this->printer->render("view/suborbitalView.html", $data);
    }
    
    /**
     * Agrega el numero del dia a todos los vuelos
     *
     * @param $array Array de vuelos
     * @param $fechaEstatica fecha del vuelo o fecha de donde empezar a contar
     * @param $esSemana boolean si es una semana, se agrega a partir del primer dia, a todos los dias, sin no, se agrega solo la fecha a empezar
     */
    private function agregarDia(&$array, $fechaEstatica)
    {
        //convierto a formato unix
        $fechaEstatica = strtotime($fechaEstatica);
        
        global $DIAS;
        $numeros = array();
    
        //Segun el nombre del dia, seteo el numero
        //Si hoy es sabado 15, el $numeros en sabado va a tener 15
        //Luego, va a recorrer, por lo que el viernes va a ser hoy +6 = 21
        //el array quedaria
        // Sabado => 15
        // Domingo => 16
        // Lunes => 17
        // etc
        for ($i = -1; $i <= 6; $i++) {
            //El dia de entrada, mas los dias que ya recorri
            $n = strtotime("+$i day", $fechaEstatica);
            
            //$DIAS tiene del 0 al 6, empezando por domingo
            $numeros[$DIAS[date('w', $n)]] = $n;
        }
        
        //Segun el dia del vuelo, asigno "nroDia"
        foreach ($array as &$vuelo) {
            $vuelo["nroDia"] = date("d/m/y", $numeros[$vuelo["dia"]]);
        }
        
        
    }
    
}

