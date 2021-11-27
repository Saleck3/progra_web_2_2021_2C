<?php

use Dompdf\Dompdf;
use Dompdf\Options;

class PdfController
{
    
    private $pdf;
    
    public function __construct()
    {
        
        require_once 'third-party/dompdf/autoload.inc.php';
        // instantiate and use the dompdf class
        $dompdf = new Dompdf();
        
        // (Optional) Setup the paper size and orientation
        $dompdf->setPaper('A4', 'landscape');
        
        $options = new Options();
        $options = $dompdf->getOptions();
        $options->set(array('isRemoteEnabled' => TRUE));
        $dompdf->setOptions($options);
        $this->pdf = $dompdf;
    }
    
    public function generarPdf($nombrePdf, $html)
    {
        $this->pdf->loadHtml($html);
        
        $this->pdf->render();
        $output = $this->pdf->output();
        file_put_contents("public/pdf/" . $nombrePdf . ".pdf", $output);
        return $nombrePdf . ".pdf";
        
        //$this->pdf->stream($nombrePdf.".pdf", array('Attachment' => false));
    }
}





