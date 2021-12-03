<?php

class MustachePrinter
{
    private $mustache;
    
    public function __construct($partialsPathLoader)
    {
        Mustache_Autoloader::register();
        $this->mustache = new Mustache_Engine(
            array(
                'partials_loader' => new Mustache_Loader_FilesystemLoader($partialsPathLoader)
            ));
    }
    
    public function render($template, $data = array())
    {
        
        //Me fijo si estoy logueado
        if (isset($_SESSION["email"])) {
            $data["logueado"] = TRUE;
        }
        
        //muestro si hay mensajes
        if (isset($_SESSION["mensaje"])) {
            $data["mensaje"] = $_SESSION["mensaje"];
            unset($_SESSION["mensaje"]);
        }
        //si es admin

        if(isset($_SESSION["id_cargo"])== 1){
            $data["admin"] = TRUE;
        }

        
        $contentAsString = file_get_contents($template);
        return $this->mustache->render($contentAsString, $data);
    }
}