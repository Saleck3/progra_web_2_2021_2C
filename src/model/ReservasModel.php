<?php

class ReservasModel
{
    private $database;
    
    public function __construct($database)
    {
        $this->database = $database;
    }
    
    public function getTipo($idUsuario)
    {
        $SQL = "select tipo from Usuario where id = $idUsuario;";
        
        $res = $this->database->query($SQL);
        
        return $res["tipo"];
    }
    
    public function getSedes()
    {
        $SQL = "select * from CentrosMedicos;";
        
        return $this->database->query($SQL);
    }
    
    public function generarReserva($id, $sede, $codigo, $fechaYHora)
    {
        
        $SQL = "INSERT INTO Reservas (codigo,centroMedico,idUsuario,fechaHora) VALUES ('$codigo', $sede,$id,'$fechaYHora')";
        return $this->database->insert($SQL);
    }
    
    public function realizarReserva($codigo, $usuario)
    {
        $SQL = "UPDATE Reservas SET realizado = 1 WHERE codigo = '$codigo' AND idUsuario = $usuario";
        return $this->database->update($SQL);
    }
    
    public function validarCodigo($codigo, $usuario)
    {
        $SQL = "select * from Reservas where id = $usuario AND codigo = '$codigo';";
    
        return $this->database->query($SQL);
        
        
    }
}