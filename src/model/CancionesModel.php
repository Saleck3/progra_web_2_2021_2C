<?php

class CancionesModel
{
    private $database;

    public function __construct($database){
        $this->database = $database;
    }

    public function getCanciones(){
        return $this->database->query("SELECT * FROM canciones");
    }

    public function getCancion($id){
        $SQL = "SELECT * FROM canciones WHERE idCancion = $id ";
        return $this->database->query($SQL);
    }
}