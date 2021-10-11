<?php
class Configuration{

    private $config;

    public  function createPresentacionesController(){
        require_once("controller/PresentacionesController.php");
        return new PresentacionesController( $this->createPresentacionesModel() , $this->createPrinter());
    }

    public  function createCancionesController(){
        require_once("controller/CancionesController.php");
        return new CancionesController( $this->createCancionesModel(), $this->getLogger() , $this->createPrinter());
    }

    public function createLaBandaController(){
        require_once("controller/LaBandaController.php");
        return new LaBandaController( $this->createPrinter());
    }

    public function createQuieroSerParteController(){
        require_once("controller/QuieroSerParteController.php");
        return new QuieroSerParteController( $this->createPrinter());
    }

    private  function createCancionesModel(){
        require_once("model/CancionesModel.php");
        $database = $this->getDatabase();
        return new CancionesModel($database);
    }

    private  function createPresentacionesModel(){
        require_once("model/PresentacionesModel.php");
        $database = $this->getDatabase();
        return new PresentacionesModel($database);
    }

    private  function getDatabase(){
        require_once("helpers/MyDatabase.php");
        $config = $this->getConfig();
        return new MyDatabase($config["servername"], $config["username"], $config["password"], $config["dbname"]);
    }

    private  function getConfig(){
        if( is_null( $this->config ))
            $this->config = parse_ini_file("config/config.ini");

        return  $this->config;
    }

    private function getLogger(){
        require_once("helpers/Logger.php");
        return new Logger();
    }

    public function createRouter($defaultController, $defaultAction){
        include_once("helpers/Router.php");
        return new Router($this,$defaultController,$defaultAction);
    }

    private function createPrinter(){
        require_once ('third-party/mustache/src/Mustache/Autoloader.php');
        require_once("helpers/MustachePrinter.php");
        return new MustachePrinter("view/partials");
    }

}