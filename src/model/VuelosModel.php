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
        $sql = "SELECT matricula FROM suborbitales_reservas where fechayhora = '" . $fecha . ' ' . $hora . "' and usuario IS NULL;";
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
    
    public function cantidadAsientosPorTipo($matricula)
    {
        $sql = "SELECT cap_gen, cap_fam, cap_sui FROM modelos m inner join nave_espacial ne on m.id = ne.modelo where ne.matricula = '$matricula';";
        return $this->database->query($sql);
    }
    
    public function generarReservaSuborbital($datos)
    {
        
        
        $sql = "INSERT INTO suborbitales_reservas(fechayhora,matricula,usuario,tipoAsiento,numeroAsiento,servicio)
                VALUES('" . $datos["fecha"] . " " . $datos["hora"] . "','" . $datos["matricula"] .
            "'," . $datos["id_usuario"] . ",'" . $datos["tipo_asiento"] . "'," . $datos["num_asiento"] .
            ",'" . $datos["servicio"] . "' );";
        return $this->database->insert($sql);
    }
    
    public function usuarioTienePasajeVuelo($fecha, $hora, $id_usuario)
    {
        $sql = "SELECT * FROM suborbitales_reservas where fechayhora = '" . $fecha . ' ' . $hora . "' and usuario = $id_usuario;";
        return $this->database->query($sql);
    }
}