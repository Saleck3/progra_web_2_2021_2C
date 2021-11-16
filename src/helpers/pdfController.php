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

    public function generarPdf($nombrePdf,$html){

        $options = new Options();
        $options = $this->pdf->getOptions();
        $options->set(array('isRemoteEnabled' => true));
        $this->pdf->setOptions($options);

        $this->pdf->loadHtml($html);

        $this->pdf->render();
        $output = $this->pdf->output();
        file_put_contents("public/pdf/".$nombrePdf.".pdf",$output);

        // $this->pdf->stream($nombrePdf.".pdf", array('Attachment' => false));
    }
}





