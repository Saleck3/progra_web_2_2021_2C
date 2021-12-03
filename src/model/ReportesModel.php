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
        
        $SQL = "select edp.id AS id,edp.idvuelo AS idvuelo,ed.fechayhora AS fechayhora,ed.desde AS desde,ed.destino AS destino,ed.matricula AS matricula,ed.duracion AS duracion,edp.idusuario AS idusuario,edp.tipoAsiento AS tipoAsiento,edp.numeroAsiento AS numeroAsiento,edp.servicio AS servicio,edp.id_preferencia AS id_preferencia from entredestinos_pagos edp join entredestinos ed on((edp.idvuelo = ed.id));";
        return $this->database->query($SQL);
    }
    
}