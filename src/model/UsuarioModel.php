<?php

class UsuarioModel
{
    private $database;

    public function __construct($database){
        $this->database = $database;
    }

    public function getUsuario($email, $pass){
        $SQL = "SELECT * FROM usuario WHERE mail = ? AND password = ? ";

        return $this->database->query($SQL);
    }
}