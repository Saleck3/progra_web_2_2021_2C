<?php

class VuelosModel
{
    private $database;
    
    public function __construct($database)
    {
        $this->database = $database;
    }
    
    public function getVuelos()
    {
        return $this->database->query("SELECT * FROM suborbitales");
    }
    
    /**
     * @param $fecha
     */
    public function getVuelosDia($fecha, $desde = NULL)
    {
        global $DIAS;
        
        $diaDeLaSemana = date('w', strtotime($fecha));
        
        $diaDeLaSemana = $DIAS["$diaDeLaSemana"];
        
        if ($desde) {
            return $this->database->query("SELECT * FROM suborbitales where dia = '$diaDeLaSemana' AND partida = '$desde' ORDER BY horario;");
        } else {
            return $this->database->query("SELECT * FROM suborbitales where dia = '$diaDeLaSemana' ORDER BY horario");
        }
    }
    
    public function getVuelosDesde($desde)
    {
        return $this->database->query("SELECT * FROM suborbitales where partida = '$desde';");
    }
    
    public function matriculaVuelo($fecha, $hora)
    {
        $sql = "SELECT matricula FROM suborbitales_reservas where fechayhora = '" . $fecha . ' ' . $hora . "';";
        return $this->database->query($sql);
    }
    
    public function asignarMatriculaOrbital($fecha, $hora)
    {
        $sql = "SELECT matricula FROM GauchoRocket.modelos m inner join nave_espacial ne on m.id = ne.modelo where tipo = 'Orbital';";
        $matriculas = $this->database->query($sql);
        
        $matriculaAInsertar = $matriculas[rand(0, sizeof($matriculas))]["matricula"];
        
        $sql = "INSERT INTO suborbitales_reservas (fechayhora, matricula)
                VALUES ('" . $fecha . ' ' . $hora . "','" . $matriculaAInsertar . "');";
        
        return $this->database->insert($sql) ? $matriculaAInsertar : FALSE;
        
    }
    
}