<?php

class Usuario
{
    private $id;
    private $nombre;
    private $mail;
    private $password;
    private $rol;
    
    /**
     * @param $mail
     * @param $password
     */
    public function __construct($mail, $password)
    {
        $this->mail = $mail;
        $this->password = md5($password);
    }
    
    public function realizar_login($mysqli)
    {
        
        
        if (($this->mail == '') || ($this->password == '')) {
            return FALSE;
        }
        
        if (isset($_SESSION["mail_usuario"])) {
            mensaje_al_usuario("error", "Ya esta logueado");
            return FALSE;
        }
        
        $sql = "SELECT id, nombre, mail, rol FROM usuario WHERE mail = ? and password = ?";
        
        if ($stmt = $mysqli->prepare($sql)) {
            $stmt->bind_param("ss", $this->mail, $this->password);
            
            
            if ($stmt->execute()) {
                $res = $stmt->get_result();
                $resultado = $res->fetch_assoc();
                
                
                //logica logueo
                if ($res == NULL || $resultado == NULL) {
                    mensaje_al_usuario("error", "Usuario o contraseña incorrectos");
                    return FALSE;
                } else {
                    $this->id = $resultado['id'];
                    $this->nombre = $resultado['nombre'];
                    $this->rol = $resultado['rol'];
                    $_SESSION['usuario'] = $this;
                    return TRUE;
                    
                }
                
                //fin logica logueo
                
            } else {
                mensaje_al_usuario('error', "error de conexion a la base de datos");
                if (isset($get_limpio['debug'])) {
                    mensaje_al_usuario('error', $stmt->error);
                }
                return FALSE;
            }
        } else {
            if (isset($get_limpio['debug'])) {
                mensaje_al_usuario('error', "Error al comunicarse con la base de datos" . $mysqli->error);
            } else {
                mensaje_al_usuario('error', "Error al comunicarse con la base de datos");
            }
            return FALSE;
        }
    }
    
    public function desloguear()
    {
        if (isset($_SESSION["mail_usuario"])) {
            unset($_SESSION["mail_usuario"]);
            unset($_SESSION['id_usuario']);
            unset($_SESSION['nombre_usuario']);
            unset($_SESSION['rol_usuario']);
        }
    }
    
}

?>