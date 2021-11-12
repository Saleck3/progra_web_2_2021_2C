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
        return $this->database->query("SELECT * FROM vuelo");
    }

}