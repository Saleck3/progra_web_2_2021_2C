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
        $SQL = "INSERT INTO Usuario (nombre, apellido, fechaNacimiento, email, password, idCargo) VALUES
        ('" . $data["nombre"] . "', '" . $data["apellido"] . "', '" . $data["fechaNac"] . "', '" . $data["mail"] . "', MD5('" . $data["pass"] . "'), 2)";
        
        return $this->database->insert($SQL);
    }
    
    public function setTipo($tipo, $usuario)
    {
        $SQL = "UPDATE Usuario SET tipo = $tipo WHERE id = $usuario";
        
        return $this->database->update($SQL);
    }
}