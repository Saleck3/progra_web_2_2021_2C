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
    
    /**
     * Lista los vuelos Suborbitales, considerando los filtros
     */
    function suborbital()
    {
        
        $data["hoy"] = date('Y-m-d');
        if ($_POST["date"]) {
            $data['diaSeleccionado'] = $_POST["date"];
            $data['vuelos'] = $this->vuelosModel->getVuelosDia($data["diaSeleccionado"], $_POST["desde"]);
        } else if (isset($_POST["desde"])) {
            $data['vuelos'] = $this->vuelosModel->getVuelosDesde($_POST["desde"]);
        } else {
            $data['vuelos'] = $this->vuelosModel->getVuelos();
        }
        
        //Agrego debug porque seria raro tenes vacios
        if (sizeof($data['vuelos']) == 0 && isset($_SESSION["debug"])) {
            var_dump($_POST);
        }
        
        //Agrego los dias, si me llego un dia paso ese, sino, la fecha de hoy
        $this->agregarDia($data['vuelos'], isset($data["diaSeleccionado"]) ? $data["diaSeleccionado"] : $data["hoy"]);
        
        echo $this->printer->render("view/suborbitalView.html", $data);
    }
    
    /**
     * Agrega el numero del dia a todos los vuelos
     *
     * @param $array Array de vuelos
     * @param $fechaEstatica fecha del vuelo o fecha de donde empezar a contar
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
    
    function suborbital_reserva()
    {
        $data["fecha"] = date('Y-m-d',$_POST["nroDia"]);
        
        $data["partida"] = $_POST["partida"];
        
        $data["fecha"] = $_POST["fecha"];
        $data["duracion"] = $_POST["duracion"];
        $data["hora"] = $_POST["hora"];
        
        var_dump($_POST);
        echo $this->printer->render("view/suborbital_reservaView.html", $data);
    }
}

