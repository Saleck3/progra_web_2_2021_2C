<?php

class Usuario
{
    /**
     * Realiza el login de un usuario
     * @param $mysqli MySQLI Objeto de base de datos con la coneccion
     * @return bool Retorna verdadero si se hizo el login y falso si hubo algun error
     */
    public static function realizar_login($mysqli, $mail, $password)
    {
        
        
        if (($mail == '') || ($password == '')) {
            return FALSE;
        }
        
        if (isset($_SESSION["usuario"])) {
            mensaje_al_usuario("error", "Ya esta logueado");
            return FALSE;
        }
        
        $sql = "SELECT id, nombre, mail, rol, validado FROM usuario WHERE mail = ? and password = MD5(?)";
        
        if ($stmt = $mysqli->prepare($sql)) {
            $stmt->bind_param("ss", $mail, $password);
            
            
            if ($stmt->execute()) {
                $res = $stmt->get_result();
                $resultado = $res->fetch_assoc();
                
                //logica logueo
                if ($resultado == NULL) {
                    mensaje_al_usuario("error", "Usuario o contraseña incorrectos");
                    return FALSE;
                } else if ($resultado["validado"] != NULL) {
                    mensaje_al_usuario("error", "Usuario no validado, por favor ingrese <a href='validarUsuario.php?code='" . $resultado["validado"] . ">aqui</a> para validarlo");
                    return FALSE;
                } else {
                    $_SESSION['id'] = $resultado['id'];
                    $_SESSION['nombre'] = $resultado['nombre'];
                    $_SESSION['mail'] = $resultado["mail"];
                    $_SESSION['rol'] = $resultado['rol'];
                    
                    //Por algun motivo no se esta mostrando
                    mensaje_al_usuario("exito", "Ingreso exitoso");
                    return TRUE;
                }
                
            } else {
                mensaje_al_usuario('error', "error de conexion a la base de datos");
                if (isset($get_limpio['debug'])) {
                    mensaje_al_usuario('error', $stmt->error);
                }
                return FALSE;
            }
        } else {
            mensaje_al_usuario('error', "Error al comunicarse con la base de datos");
            if (isset($get_limpio['debug'])) {
                mensaje_al_usuario('error', "Error al comunicarse con la base de datos" . $mysqli->error);
            }
            return FALSE;
        }
    }
    
    public static function existe($mysqli, $mail)
    {
        $sql = "SELECT id FROM usuario WHERE mail = ?";
        
        if ($stmt = $mysqli->prepare($sql)) {
            $stmt->bind_param("s", $mail);
            if ($stmt->execute()) {
                $res = $stmt->get_result();
                return $res->fetch_assoc();
            } else {
                mensaje_al_usuario('error', "error de conexion a la base de datos");
                if (isset($get_limpio['debug'])) {
                    mensaje_al_usuario('error', $stmt->error);
                }
                return FALSE;
            }
        } else {
            mensaje_al_usuario('error', "Error al comunicarse con la base de datos");
            if (isset($get_limpio['debug'])) {
                mensaje_al_usuario('error', "Error al comunicarse con la base de datos" . $mysqli->error);
            }
            return FALSE;
        }
        
    }
    
    public static function registrar($mysqli, $mail, $password, $nombre, $rol = "usuario")
    {
        if ($mail == "" || $password == "") {
            mensaje_al_usuario('error', "Debe ingresar un usuario y password");
            return FALSE;
        }
        
        if (self::existe($mysqli, $mail)) {
            mensaje_al_usuario('error', "Ya existe un usuario con ese mail");
            return FALSE;
        }
        
        $sql = "insert into usuario (nombre, mail,password,rol,validado) values (?, ?, MD5(?),?,?)";
        
        $code = MD5($_SERVER["REQUEST_TIME"]);
        
        if ($stmt = $mysqli->prepare($sql)) {
            $stmt->bind_param("sssss", $nombre, $mail, $password, $rol, $code);
            
            if ($stmt->execute()) {
                return $code;
                
            } else {
                mensaje_al_usuario('error', "error de conexion a la base de datos");
                if (isset($get_limpio['debug'])) {
                    mensaje_al_usuario('error', $stmt->error);
                }
                return FALSE;
            }
        } else {
            mensaje_al_usuario('error', "error de conexion a la base de datos");
            if (isset($get_limpio['debug'])) {
                mensaje_al_usuario('error', $stmt->error);
            }
            return FALSE;
        }
    }
    
    
    public static function validar($mysqli, $code)
    {
        
        $sql = "update usuario set validado = null where validado = ?";
        
        if ($stmt = $mysqli->prepare($sql)) {
            $stmt->bind_param("s", $code);
            
            if ($stmt->execute()) {
                return TRUE;
                
            } else {
                mensaje_al_usuario('error', "error de conexion a la base de datos");
                if (isset($get_limpio['debug'])) {
                    mensaje_al_usuario('error', $stmt->error);
                }
                return FALSE;
            }
        } else {
            mensaje_al_usuario('error', "error de conexion a la base de datos");
            if (isset($get_limpio['debug'])) {
                mensaje_al_usuario('error', $stmt->error);
            }
            return FALSE;
        }
    }
    
    public static function desloguear()
    {
        unset($_SESSION['id']);
        unset($_SESSION['nombre']);
        unset($_SESSION['mail']);
        unset($_SESSION['rol']);
    }
}
