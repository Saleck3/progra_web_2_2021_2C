<?php

class ReservasController
{
    private $printer;
    private $reservasModel;
    private $usuarioModel;
    
    public function __construct($printer, $reservasModel, $usuarioModel)
    {
        $this->printer = $printer;
        $this->reservasModel = $reservasModel;
        $this->usuarioModel = $usuarioModel;
    }
    
    function show()
    {
        
        if (!$data["conTipo"] = $this->reservasModel->getTipo($_SESSION["id"])) {
            $data["sedes"] = $this->reservasModel->getSedes();
        }
        
        echo $this->printer->render("view/reservasView.html", $data);
    }
    
    function reservarTurno()
    {
        $sede = $_GET["sede"];
        //Dar turno y mandar por mail
        $codigo = MD5(time());
        $link = "/reservas/asignarTipo?codigo=" . $codigo;
        $data["link"] = $link;
        $fechaYHora =$this->horaReserva();
        var_dump($fechaYHora);
        $this->reservasModel->generarReserva($_SESSION["id"], $sede, $codigo, $fechaYHora);
        echo $this->printer->render("view/reservarTurnoView.html", $data);
    }
    
    function asignarTipo()
    {
        
        $codigo = $_GET["codigo"];
        $usuario = $_SESSION["id"];
        
        //Chequeo si el codigo es del usuario logueado
        if (!$this->reservasModel->realizarReserva($codigo, $usuario)) {
            $_SESSION["mensaje"]["class"] = "error";
            $_SESSION["mensaje"]["mensaje"] = "El codigo no pertenece al usuario logueado";
            echo $this->printer->render("view/homeView.html");
            die();
        }
        
        //Realiza la reserva (para que no se haga 2 veces) y asigna tipo
        if ($this->reservasModel->realizarReserva($codigo, $usuario)) {
            //Random segun enunciado
            $tipo = $this->randomConProbabilidad();
            
            
            $this->usuarioModel->setTipo($tipo, $usuario);
        } else {
            $_SESSION["mensaje"]["class"] = "error";
            $_SESSION["mensaje"]["mensaje"] = "Usted ya asistio al turno y su tipo fue asignado";
            echo $this->printer->render("view/reservasView.html");
            die();
        }
        header('Location: /');
    }
    
    function randomConProbabilidad()
    {
        $r = rand(1, 101);
        
        if ($r <= 60) {
            return 3;
        } else if ($r <= 90) {
            return 2;
        } else
            return 1;
    }

    function intervalo(){
        $r = rand(1, 100);

        if ($r <= 50) {
            return 0;
        } else if($r <= 100)
            return 30;


}

    function randomDateInRange() {
        $start = new DateTime('now');
        $start->modify('+7 day');
         $end = new DateTime('now');
         $end ->modify('+14 day');
        $randomTimestamp = mt_Rand($start->getTimestamp(), $end->getTimestamp());
        $randomDate = new DateTime();
        $randomDate->setTimestamp($randomTimestamp);
        return $randomDate;
    }
    function horaReserva(){
    
        //TODO: Asignar hora y fecha que no este tomada en un futuro (no la actual)
            $randomDate=$this->randomDateInRange();
            $minutos=$this->intervalo();
            $turnoRandom =new DateTime();
            $turnoRandom->setTimestamp($randomDate->getTimestamp());
            $turnoRandom->setTime(mt_rand(9,18),$minutos);
            return $turnoRandom->format('Y-m-d H:i:s');





        //        $flag = 0;
//        while ($flag){
//            coseguir $turnoRandom (dia y hora segun array harcodeado)
//	if(!select * from Reservas where fechaHora = XXXX AND sede = $sede)
//        if((select count(*) from Reservas where centroMedico = $sede AND fechaHora = $dia ) <  select cantidadTurnos from CentrosMedicos where id = $sede;){
//            return $turnoRandom;
//        }
    
    }
}