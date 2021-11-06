<?php

use PHPMailer\PHPMailer\PHPMailer;

class mailController
{
    private $mail;
    
    public function __construct($config)
    {
        require_once('third-party/phpmailer/exception.php');
        require_once('third-party/phpmailer/phpMailer.php');
        require_once('third-party/phpmailer/smtp.php');
        $mail = new PHPMailer();
        
        
        //Crear una instancia de PHPMailer
        $mail = new PHPMailer();
        //Definir que vamos a usar SMTP
        $mail->IsSMTP();
        //Esto es para activar el modo depuración. En entorno de pruebas lo mejor es 2, en producción siempre 0
        // 0 = off (producción)
        // 1 = client messages
        // 2 = client and server messages
        $mail->SMTPDebug = 0;
        //Ahora definimos gmail como servidor que aloja nuestro SMTP
        $mail->Host = 'smtp.gmail.com';
        //El puerto será el 587 ya que usamos encriptación TLS
        $mail->Port = 587;
        //Definmos la seguridad como TLS
        $mail->SMTPSecure = 'tls';
        //Tenemos que usar gmail autenticados, así que esto a TRUE
        $mail->SMTPAuth = TRUE;
        //Definimos la cuenta que vamos a usar. Dirección completa de la misma
        $mail->Username = $config["mail"];
        //Introducimos nuestra contraseña de gmail
        $mail->Password = $config["mailpass"];
        //Definimos el remitente (dirección y, opcionalmente, nombre)
        $mail->SetFrom($config["mail"], 'GauchoRocket');
        //Y, ahora sí, definimos el destinatario (dirección y, opcionalmente, nombre)
        
        //Definimos el tema del email
        $mail->isHTML(TRUE);// Set email format to HTML
        $mail->AltBody = 'Mail de gauchorocket';
        
        $this->mail = $mail;
        
    }
    
    /**
     * @param $destinatario Mail del destinatario
     * @param $asunto Asunto del mail
     * @param $mensaje Cuerpo del mail (por ahora texto plano)
     * @param string $destinatarioNombre Nombre del Cliente
     * @throws \PHPMailer\PHPMailer\Exception
     */
    public function enviarMail($destinatario, $asunto, $mensaje, $destinatarioNombre = 'Cliente')
    {
        
        $this->mail->AddAddress($destinatario, $destinatarioNombre);
        $this->mail->Subject = $asunto;
        //Para enviar un correo formateado en HTML lo cargamos con la siguiente función. Si no, puedes meterle directamente una cadena de texto.
        //$mail->MsgHTML(file_get_contents('correomaquetado.html'), dirname(ruta_al_archivo));
        //Y por si nos bloquean el contenido HTML (algunos correos lo hacen por seguridad) una versión alternativa en texto plano (también será válida para lectores de pantalla)
        $this->mail->Body = $mensaje;
        //Enviamos el correo
        if (!$this->mail->Send()) {
            if (isset($_SESSION["debug"])) {
                var_dump($this->mail->ErrorInfo);
            }
        }
    }
    
}