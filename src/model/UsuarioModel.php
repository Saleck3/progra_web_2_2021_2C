<?php

class UsuarioModel
{
    private $database;
    
    public function __construct($database)
    {
        $this->database = $database;
    }
    
    public function getUsuario($email, $pass)
    {
        $SQL = "SELECT * FROM Usuario WHERE email = \"$email\" AND password = \"$pass\"";
        return $this->database->query($SQL);
    }
    
    public function registrarUsuario($data)
    {
        $SQL = "INSERT INTO Usuario (nombre, apellido, fechaNacimiento, email, password, id_cargo) VALUES
        ('" . $data["nombre"] . "', '" . $data["apellido"] . "', '" . $data["fechaNac"] . "', '" . $data["mail"] . "', MD5('" . $data["pass"] . "'), 2)";
        
        return $this->database->insert($SQL);
    }
}