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

    public function validarDisponibilidad($sede, $fecha)
    {
        $SQL = "select convert(fechaHora,DATE) fechaHora, CM.nombre CentroMedico,CM.id idCentroMedico,cantidadTurnos-count(convert(fechaHora,DATE)) as Disponible 
                    from reservas as R
                    inner join centrosmedicos as CM on R.centroMedico = CM.id
                    where CM.id = $sede and convert(fechaHora,DATE) = '$fecha' 
                    group by convert(fechaHora,DATE),CM.id;";

        return $this->database->query($SQL);


    }
}