<?php

class ReportesModel
{
    private $database;
    
    public function __construct($database)
    {
        $this->database = $database;
    }
    
    public function getSuborbitales($usuario)
    {
        $SQL = "SELECT * FROM suborbitales_reservas where usuario = $usuario";
        return $this->database->query($SQL);
    }
    
    public function getTours($usuario)
    {
        $SQL = "SELECT * FROM tour_reservas where usuario = $usuario";
        return $this->database->query($SQL);
    }
    
    public function getEntreDestinos($usuario)
    {
        $SQL = "SELECT * FROM entredestinos_reservas_completo where idusuario = $usuario";
        return $this->database->query($SQL);
    }
    
}