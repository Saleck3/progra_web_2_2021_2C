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
    
    public function getTour()
    {
        return $this->database->query("SELECT * FROM tour");
    }
    
    public function getVuelosED()
    {
        return $this->database->query("SELECT * FROM entredestinos");
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
    
    public function getTourDia($fecha, $desde = NULL)
    {
        global $DIAS;
        
        $domingo = date('w', strtotime($fecha));
        
        $domingo = $DIAS["$domingo"];
        
        if ($desde) {
            return $this->database->query("SELECT * FROM tour where dia = '$domingo' AND partida = '$desde';");
        } else {
            return $this->database->query("SELECT * FROM tour where dia = '$domingo';");
        }
    }
    
    public function getVuelosDesde($desde)
    {
        return $this->database->query("SELECT * FROM suborbitales where partida = '$desde';");
    }
    
    public function getToursDesde($desde)
    {
        return $this->database->query("SELECT * FROM tour WHERE partida = '$desde';");
    }
    
    
    public function matriculaVuelo($fecha, $hora, $partida)
    {
        $sql = "SELECT matricula FROM suborbitales_reservas where fechayhora = '" . $fecha . ' ' . $hora . "'and desde = '$partida' and usuario IS NULL;";
        return $this->database->query($sql);
    }
    
    public function matriculaVueloTour($fecha, $hora, $partida)
    {
        $sql = "SELECT matricula FROM tour_reservas where fechayhora = '" . $fecha . ' ' . $hora . "'and desde = '$partida' and usuario IS NULL;";
        return $this->database->query($sql);
    }
    
    public function matriculaVueloEntreDestinos($vuelo)
    {
        $sql = "SELECT matricula 
                FROM entredestinos 
                where id = $vuelo";
        return $this->database->query($sql);
    }
    
    public function asignarMatriculaOrbital($fecha, $hora, $desde)
    {
        $sql = "SELECT matricula FROM GauchoRocket.modelos m inner join nave_espacial ne on m.id = ne.modelo where tipo = 'Orbital';";
        $matriculas = $this->database->query($sql);
        
        $matriculaAInsertar = $matriculas[rand(0, sizeof($matriculas))]["matricula"];
        
        $sql = "INSERT INTO suborbitales_reservas (fechayhora, matricula,desde)
                VALUES ('$fecha $hora','$matriculaAInsertar', '$desde');";
        
        return $this->database->insert($sql) ? $matriculaAInsertar : FALSE;
        
    }
    
    public function asignarMatriculaTour($fecha, $hora, $desde)
    {
        $sql = "SELECT matricula FROM GauchoRocket.modelos m inner join nave_espacial ne on m.id = ne.modelo where m.modelo like 'Guanaco'";
        $matricula = $this->database->query($sql);
        
        $matriculaAInsertar = $matricula[rand(0, sizeof($matricula))]["matricula"];
        
        $sql = "INSERT INTO tour_reservas (fechayhora, matricula,desde)
                VALUES ('$fecha $hora','$matriculaAInsertar', '$desde');";
        
        return $this->database->insert($sql) ? $matriculaAInsertar : FALSE;
        
    }
    
    
    public function cantidadAsientosPorTipo($matricula)
    {
        $sql = "SELECT cap_gen, cap_fam, cap_sui FROM modelos m inner join nave_espacial ne on m.id = ne.modelo where ne.matricula = '$matricula';";
        return $this->database->query($sql);
    }
    
    public function generarReservaSuborbital($datos)
    {
        $sql = "INSERT INTO suborbitales_reservas(fechayhora,desde,matricula,usuario,tipoAsiento,numeroAsiento,servicio)
                VALUES('" . $datos["fechayhora"] . "','" . $datos["desde"] . "','" . $datos["matricula"] .
            "'," . $datos["usuario"] . ",'" . $datos["tipoAsiento"] . "'," . $datos["numeroAsiento"] .
            ",'" . $datos["servicio"] . "' );";
        //var_dump($sql);
        return $this->database->insert($sql);
    }
    
    public function generarReservaTour($datos)
    {
        $sql = "INSERT INTO tour_reservas(fechayhora,desde,matricula,usuario,tipoAsiento,numeroAsiento,servicio)
                VALUES('" . $datos["fechayhora"] . "','" . $datos["desde"] . "','" . $datos["matricula"] .
            "'," . $datos["usuario"] . ",'" . $datos["tipoAsiento"] . "'," . $datos["numeroAsiento"] .
            ",'" . $datos["servicio"] . "' );";
        return $this->database->insert($sql);
    }
    
    
    public function usuarioTienePasajeVuelo($fecha, $hora, $partida, $id_usuario)
    {
        $sql = "SELECT * FROM suborbitales_reservas where fechayhora = '$fecha $hora' and desde = '$partida' and usuario = $id_usuario;";
        return $this->database->query($sql);
    }
    
    public function asientoOcupado($fecha, $hora, $partida, $tipoAsiento, $numeroAsiento)
    {
        $sql = "SELECT * FROM suborbitales_reservas where fechayhora = '$fecha $hora' and desde = '$partida' and tipoAsiento = '$tipoAsiento' and numeroAsiento = $numeroAsiento;";
        return $this->database->query($sql);
    }
    
    public function asientoOcupadoEntreDestinos($idvuelo, $tipoAsiento, $numeroAsiento)
    {
        $sql = "SELECT * FROM entredestinos_reservas where idvuelo = $idvuelo and tipoAsiento = '$tipoAsiento' and numeroAsiento = $numeroAsiento;";
        return $this->database->query($sql);
    }
    
    public function usuarioTienePasajeVueloTour($fecha, $hora, $partida, $id_usuario)
    {
        $sql = "SELECT * FROM tour_reservas where fechayhora = '$fecha $hora' and desde = '$partida' and usuario = $id_usuario;";
        return $this->database->query($sql);
    }
    
    public function usuarioTienePasajeVueloEntreDestinos($idvuelo, $id_usuario)
    {
        $sql = "SELECT * FROM entredestinos_reservas where idvuelo = '$idvuelo'and idusuario = $id_usuario;";
        return $this->database->query($sql);
    }
    
    public function asientoOcupadoTour($fecha, $hora, $partida, $tipoAsiento, $numeroAsiento)
    {
        $sql = "SELECT * FROM tour_reservas where fechayhora = '$fecha $hora' and desde = '$partida' and tipoAsiento = '$tipoAsiento' and numeroAsiento = $numeroAsiento;";
        return $this->database->query($sql);
    }
    
    public function tipoUsuario($idUsuario)
    {
        $sql = "SELECT tipo FROM usuario where id = $idUsuario;";
        return $this->database->query($sql);
    }
    
    public function guardarPagoSuborbitales($datos)
    {
        $sql = "INSERT INTO suborbitales_pagos(fechayhora,desde,matricula,usuario,tipoAsiento,numeroAsiento,servicio,id_preferencia)
                VALUES('" . $datos["fecha"] . " " . $datos["hora"] . "','" . $datos["partida"] . "','" . $datos["matricula"] .
            "'," . $datos["id_usuario"] . ",'" . $datos["tipo_asiento"] . "'," . $datos["num_asiento"] .
            ",'" . $datos["servicio"] . "','" . $datos["preferencia"] . "' );";
        
        return $this->database->insert($sql);
    }
    
    public function guardarPagoTour($datos)
    {
        $sql = "INSERT INTO tour_pagos(fechayhora,desde,matricula,usuario,tipoAsiento,numeroAsiento,servicio,id_preferencia)
                VALUES('" . $datos["fecha"] . " " . $datos["hora"] . "','" . $datos["partida"] . "','" . $datos["matricula"] .
            "'," . $datos["id_usuario"] . ",'" . $datos["tipo_asiento"] . "'," . $datos["num_asiento"] .
            ",'" . $datos["servicio"] . "','" . $datos["preferencia"] . "' );";
        
        return $this->database->insert($sql);
    }
    
    public function guardarPagoEntreDestinos($datos)
    {
        $sql = "INSERT INTO entredestinos_pagos(idvuelo, idusuario, tipoAsiento, numeroAsiento,servicio, id_preferencia)
        VALUES (" . $datos['idvuelo'] . "," . $datos['id_usuario'] . ",'" . $datos['tipo_asiento'] . "','" . $datos['num_asiento'] . "','" . $datos['servicio'] . "','" . $datos['preferencia'] . "')";
        
        return $this->database->insert($sql);
    }
    
    public function recuperarPago($preferencia)
    {
        $sql = "
        select * from (
                SELECT * FROM suborbitales_pagos sub
            union all
                SELECT * FROM tour_pagos tour
        ) as a where id_preferencia = '$preferencia';";
        return $this->database->query($sql);
    }
    
    public function eliminarPagoRealizado($preferencia)
    {
        $sql = "DELETE FROM suborbitales_pagos where id_preferencia = '$preferencia';";
        return $this->database->delete($sql);
    }
    
    public function eliminarPagoRealizadoTour($preferencia)
    {
        $sql = "DELETE FROM tour_pagos where id_preferencia = '$preferencia';";
        return $this->database->delete($sql);
    }
    
    public function eliminarPagoRealizadoEntreDestinos($preferencia)
    {
        $sql = "DELETE FROM entredestinos_pagos where id_preferencia = '$preferencia';";
        return $this->database->delete($sql);
    }
    
    public function asientosReservados($fecha, $hora, $partida, $matricula)
    {
        $sql = "SELECT tipoAsiento,numeroAsiento 
        FROM suborbitales_reservas 
        WHERE fechayhora = '$fecha $hora' 
        and desde = '$partida'
        and matricula = '$matricula'";
        return $this->database->query($sql);
    }
    
    public function asientosReservadosTour($fecha, $hora, $partida, $matricula)
    {
        $sql = "SELECT tipoAsiento,numeroAsiento 
        FROM tour_reservas 
        WHERE fechayhora = '$fecha $hora' 
        and desde = '$partida'
        and matricula = '$matricula'";
        return $this->database->query($sql);
    }
    
    public function asientosReservadosEntreDestinos($idvuelo)
    {
        $sql = "SELECT tipoAsiento,numeroAsiento 
        FROM entredestinos_reservas er
        WHERE er.idvuelo = $idvuelo";
        return $this->database->query($sql);
    }
    
    public function recuperarPagoEntreDestinos($id_preferencia)
    {
        $sql = "SELECT * FROM entredestinos_pagos edp INNER JOIN entredestinos ed ON edp.idvuelo = ed.id where id_preferencia = '$id_preferencia';";
        return $this->database->query($sql);
    }
    
    public function generarReservaEntreDestinos($datos)
    {
        $sql = "INSERT INTO entredestinos_reservas(idvuelo, idusuario, tipoAsiento, numeroAsiento,servicio)
        VALUES (" . $datos['idvuelo'] . "," . $datos['idusuario'] . ",'" . $datos['tipoAsiento'] . "','" . $datos['numeroAsiento'] . "','" . $datos['servicio'] . "');";
        return $this->database->insert($sql);
    }
    
}