<?php

class Configuration
{
    
    private $config;
    
    
    public function createLoginController()
    {
        require_once("controller/LoginController.php");
        return new LoginController($this->createUsuarioModel(), $this->getLogger(), $this->createPrinter());
    }
    
    
    private function createUsuarioModel()
    {
        require_once("model/UsuarioModel.php");
        $database = $this->getDatabase();
        return new UsuarioModel($database);
    }
    
    private function getDatabase()
    {
        require_once("helpers/MyDatabase.php");
        $config = $this->getConfig();
        return new MyDatabase($config["servername"], $config["username"], $config["password"], $config["dbname"]);
    }
    
    private function getConfig()
    {
        if (is_null($this->config))
            $this->config = parse_ini_file("config/config.ini");
        
        return $this->config;
    }
    
    private function getLogger()
    {
        require_once("helpers/Logger.php");
        return new Logger();
    }
    
    public function createRouter($defaultController, $defaultAction)
    {
        include_once("helpers/Router.php");
        return new Router($this, $defaultController, $defaultAction);
    }
    
    private function createPrinter()
    {
        require_once('third-party/mustache/src/Mustache/Autoloader.php');
        require_once("helpers/MustachePrinter.php");
        return new MustachePrinter("view/partials");
    }
    
    public function createHomeController()
    {
        require_once("controller/HomeController.php");
        return new HomeController($this->createPrinter());
    }
    
    
    public function createRegistrarmeController()
    {
        require_once("controller/RegistrarmeController.php");
        return new RegistrarmeController($this->createUsuarioModel(), $this->getLogger(), $this->createPrinter());
    }
    
    private function createReservasModel()
    {
        require_once("model/ReservasModel.php");
        $database = $this->getDatabase();
        return new ReservasModel($database);
    }
    
    public function createReservasController()
    {
        require_once("controller/ReservasController.php");
        return new ReservasController($this->createPrinter(), $this->createReservasModel(), $this->createUsuarioModel());
    }
    
    public function createDebugController()
    {
        require_once("controller/DebugController.php");
        return new DebugController();
    }
}