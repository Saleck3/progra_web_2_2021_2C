<?php

class QrController
{
    
    public function __construct()
    {
        require 'third-party/phpqrcode/qrlib.php';
        
    }
    
    /**
     * @param $dato string el dato que va a contener el QR
     * @return png_base64   Retorna la imagen como texto en base 64
     */
    function generarQr($dato)
    {
        if (!$dato) {
            $dato = time();
        }
        $fileName = "public/imagenqr/qr_" . $dato . ".png";
        QRcode::png($dato, $fileName, 'L', 5, 1);
        
        $type = pathinfo($fileName, PATHINFO_EXTENSION);
        $data = file_get_contents($fileName);
        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
        return $base64;
    }
    
}





