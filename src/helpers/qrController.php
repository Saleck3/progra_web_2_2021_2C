<?php

class QrController{

    public function __construct(){
        require 'third-party/phpqrcode/qrlib.php';
        
    }

    function generarQr(){
        $dato 	= 	time();
        $fileName = "public/imagenqr/qr_".$dato.".png";
        QRcode::png($dato,$fileName,'L',10,5);
        return $fileName;
    }

}





