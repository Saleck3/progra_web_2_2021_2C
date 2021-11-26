<?php

class MercadoPagoController
{
    
    private $payment;
    
    public function __construct($config)
    {
        //Agrego el SDK
        require_once 'third-party/mercadoPago/autoload.php';
        // Agrega credenciales
        MercadoPago\SDK::setAccessToken($config["MP-Token"]);
    }
    
    /**
     * @param $titulo string Titulo de la venta
     * @param $descripcion string descripcion larga
     * @param $costo integer costo del elemento
     * @return \MercadoPago\Preference
     * @throws Exception
     */
    public function pagoReserva($titulo, $descripcion, $costo)
    {
        
        
        // Crea un objeto de preferencia
        $preference = new MercadoPago\Preference();
        
        // Crea un ítem en la preferencia
        $item = new MercadoPago\Item();
        $item->title = $titulo;
        $item->description = $descripcion;
        $item->quantity = 1;
        $item->unit_price = $costo;
        $preference->back_urls = array(
            "success" => "http://" . $_SERVER['HTTP_HOST'] . "/vuelos/generarComprobante",
            "failure" => "http://" . $_SERVER['HTTP_HOST'] . "/vuelos/errorDePago",
            "pending" => "http://" . $_SERVER['HTTP_HOST'] . "/vuelos/cobroPendiente"
        );
        $preference->items = array($item);
        $preference->save();
        return $preference;
    }
    
    
}