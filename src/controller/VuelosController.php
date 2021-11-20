<?php

class VuelosController
{
    
    private $vuelosModel;
    private $log;
    private $printer;
    private $pdf;
    private $qr;
    
    public function __construct($logger, $printer, $vuelosModel, $pdf, $qr)
    {
        $this->vuelosModel = $vuelosModel;
        $this->log = $logger;
        $this->printer = $printer;
        $this->pdf = $pdf;
        $this->qr = $qr;
    }
    
    function show()
    {
        
        echo $this->printer->render("view/vuelosView.html");
    }
    
    /**
     * Lista los vuelos Suborbitales, considerando los filtros
     */
    
    function tour()
    {
        if ($_POST) {
            $data["hoy"] = date('Y-m-d');
            if (isset($_POST["date"]) && $_POST["date"]) {
                $data['diaSeleccionado'] = $_POST["date"];
                $data['vuelos'] = $this->vuelosModel->getVuelosDia($data["diaSeleccionado"], $_POST["desde"]);
            } else if (isset($_POST["desde"])) {
                $data['vuelos'] = $this->vuelosModel->getVuelosDesde($_POST["desde"]);
            } else {
                $data['vuelos'] = $this->vuelosModel->getVuelos();
            }
            $this->agregarDia($data['vuelos'], isset($data["diaSeleccionado"]) ? $data["diaSeleccionado"] : $data["hoy"]);
            $data['post'] = "soy post";
        } else {
            $data['post'] = "no soy post";
        }
        
        echo $this->printer->render("view/tourView.html", $data);
    }
    
    function entreDestinos()
    {
        $data['vuelos'] = $this->vuelosModel->getVuelos();
        echo $this->printer->render("view/entreDestinosView.html", $data);
    }
    
    function suborbital()
    {
        
        $data["hoy"] = date('Y-m-d');
        if (isset($_POST["date"]) && $_POST["date"]) {
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
            $vuelo["nroDia"] = date("d/m/Y", $numeros[$vuelo["dia"]]);
        }
        
        
    }
    
    function suborbital_reserva()
    {
        //Me aseguro que este logueado
        if (!isset($_SESSION["id"])) {
            $_SESSION["mensaje"]["class"] = "warning";
            $_SESSION["mensaje"]["mensaje"] = "Debe loguearse para poder reservar un vuelo";
            header('Location: /login');
        }
        
        //datos que vienen del post
        $nroDia = $_POST["nroDia"];
        $data["fecha"] = str_replace("/", "-", $nroDia);
        $data["fecha"] = date('Y-m-d', strtotime($data["fecha"]));
        $data["partida"] = $_POST["partida"];
        $data["duracion"] = $_POST["duracion"];
        $data["horario"] = $_POST["hora"];
        
        //chequear si ya alguien reservo en ese mismo vuelo, y traer la matricula
        if ($data["matricula"] = $this->vuelosModel->matriculaVuelo($data["fecha"], $data["horario"])) {
            //acomodo el array para que sea un string
            //sino mustache explota
            $data["matricula"] = $data["matricula"]["matricula"];
        } else {
            //asigno una matricula
            $data["matricula"] = $this->vuelosModel->asignarMatriculaOrbital($data["fecha"], $data["horario"]);
        }
        
        //Segun el tipo de avion, los asientos que tenga
        //$cantidadDeAsientosPorTipo = $this->vuelosModel->cantidadAsientosPorTipo($data["matricula"]);
        
        //armar el combo box segun la cantidad
//        $cantidadDeAsientosPorTipo - $cantidadReservada;
//        $cantidadDeAsientosDisponiblesPorTipo;
        
        echo $this->printer->render("view/suborbital_reservaView.html", $data);
        
    }
    
    function generarComprobante()
    {
        $data = array();
        $data["fecha"] = $_POST["fecha"];
        $data["hora"] = $_POST["hora"];
        $data["partida"] = $_POST["partida"];
        $data["duracion"] = $_POST["duracion"];
        $data["matricula"] = $_POST["matricula"];
        $data["tipo_asiento"] = $_POST["tipo_asiento"];
        $data["num_asiento"] = $_POST["num_asiento"];
        $data["servicio"] = $_POST["servicio"];
        $data["qr"] = $this->qr->generarQr();
        
        
        ob_start();
        echo $this->printer->render("view/datosPdf.html", $data);
        $html = ob_get_clean();
        
        $numeroForm = rand(0, 1000);
        
        $this->pdf->generarPdf("formulario" . $numeroForm, $html);
    }
}

