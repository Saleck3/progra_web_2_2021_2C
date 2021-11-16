<?php

use Dompdf\Dompdf;
use Dompdf\Options;

class pdfController{

    private $pdf;

    public function __construct(){

        require_once 'third-party/dompdf/autoload.inc.php';
        // instantiate and use the dompdf class
        $dompdf = new Dompdf();

        // (Optional) Setup the paper size and orientation
        $dompdf->setPaper('A4', 'landscape');

        $this->pdf = $dompdf;
    }

    public function generarPdf($contenido,$nombrePdf){
        $options = new Options();
//$options = $this->pdf->getOptions();
$options->setIsHtml5ParserEnabled(true);
$this->pdf->setOptions($options);


        $this->pdf->loadHtml($contenido);
        // Render the HTML as PDF
        $this->pdf->render();
        $this->pdf->set_base_path('public/css/pdfStyle.css');

        // Output the generated PDF to Browser
        $this->pdf->stream($nombrePdf.".pdf" , ['Attachment' => 0]);
    }
}





