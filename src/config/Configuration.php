<?php

static $DIAS = array("Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado");

class Configuration
{
    
    private $config;
    
    
    public function createLoginController()
    {
        require_once("controller/LoginController.php");
        return new LoginController($this->createUsuarioModel(), $this->getLogger(), $this->createPrinter());
    }
    
    public function createVuelosController()
    {
        require_once("controller/VuelosController.php");
        return new VuelosController($this->getLogger(), $this->createPrinter(), $this->createVuelosModel(), $this->createPdfController(), $this->createQrController(),$this->createMercadoPagoController());
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
            $this->config = parse_ini_file("config/config.ini", TRUE);
        
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
        return new RegistrarmeController($this->createUsuarioModel(), $this->getLogger(), $this->createPrinter(), $this->createMailer());
    }
    
    private function createReservasModel()
    {
        require_once("model/ReservasModel.php");
        $database = $this->getDatabase();
        return new ReservasModel($database);
    }
    
    private function createVuelosModel()
    {
        
        require_once("model/VuelosModel.php");
        $database = $this->getDatabase();
        return new VuelosModel($database);
    }
    
    public function createReservasController()
    {
        require_once("controller/ReservasController.php");
        return new ReservasController($this->createPrinter(), $this->createReservasModel(), $this->createUsuarioModel(), $this->createMailer());
    }
    
    public function createDebugController()
    {
        require_once("controller/DebugController.php");
        return new DebugController();
    }
    
    public function createMailer()
    {
        require_once("helpers/MailController.php");
        return new MailController($this->getConfig());
    }
    
    public function createPdfController()
    {
        require_once("helpers/PdfController.php");
        return new PdfController();
    }
    
    public function createQrController()
    {
        require_once("helpers/QrController.php");
        return new QrController();
    }
    
    public function createMercadoPagoController()
    {
        require_once 'helpers/MercadoPagoController.php';
        return new MercadoPagoController($this->getConfig());
    }
}