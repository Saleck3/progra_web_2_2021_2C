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
        $SQL = "SELECT * FROM usuario WHERE email = \"$email\" AND password = \"$pass\"";
        return $this->database->query($SQL);
    }
    
    public function registrarUsuario($data)
    {
        $SQL = "INSERT INTO usuario (nombre, apellido, fechaNacimiento, email, password, idCargo,codigoValidacion) VALUES
        ('" . $data["nombre"] . "', '" . $data["apellido"] .
            "', '" . $data["fechaNac"] . "', '" . $data["mail"] . "', MD5('" . $data["pass"] . "'), 2, '" . $data["codigoValidacion"] . "')";
        
        return $this->database->insert($SQL);
    }
    
    public function setTipo($tipo, $usuario)
    {
        $SQL = "UPDATE usuario SET tipo = $tipo WHERE id = $usuario";
        
        return $this->database->update($SQL);
    }
    
    public function validarUsuario($codigo)
    {
        $SQL = "update usuario set codigoValidacion = null where codigoValidacion = '$codigo'";
        return $this->database->update($SQL);
    }
}