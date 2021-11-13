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
    public function getVuelosDia($fecha)
    {
        $diaDeLaSemana = date('w', strtotime($fecha));
        
        //Cambio numero a nombre
        switch ($diaDeLaSemana) {
            case 0:
            {
                $diaDeLaSemana = 'Domingo';
                break;
            }
            case 1:
            {
                $diaDeLaSemana = 'Lunes';
                break;
            }
            case 2:
            {
                $diaDeLaSemana = 'Martes';
                break;
            }
            case 3:
            {
                $diaDeLaSemana = 'Miercoles';
                break;
            }
            case 4:
            {
                $diaDeLaSemana = 'Jueves';
                break;
            }
            case 5:
            {
                $diaDeLaSemana = 'Viernes';
                break;
            }
            case 6:
            {
                $diaDeLaSemana = 'Sabado';
                break;
            }
            default:
                $diaDeLaSemana = "dia";
        }
        //TODO Agregar filtro de lugar de salida
        return $this->database->query("SELECT * FROM suborbitales where dia = '$diaDeLaSemana' ORDER BY horario");
    }
    
}