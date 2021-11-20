<?php

class QrController{

    public function __construct(){
        require 'third-party/phpqrcode/qrlib.php';
        
    }

    function generarQr(){
        $dato 	= 	time();
        $fileName = "public/imagenqr/qr_".$dato.".png";
        QRcode::png($dato,$fileName,'L',5,1);

        $type = pathinfo($fileName, PATHINFO_EXTENSION);
        $data = file_get_contents($fileName);
        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
        return $base64;
    }

}





