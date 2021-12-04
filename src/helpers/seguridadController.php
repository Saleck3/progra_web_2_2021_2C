<?php

class SeguridadController{    

    function __construct( ){
    }

    function estaLogueado($idUsuario, $esAdmin = null){
        if(!isset($idUsuario)){
            header('Location: /Login');
        }

        if(isset($esAdmin)){
            if(!$esAdmin){
            return 'No tiene los permisos necesario para entrar a esta seccion';
        }
        }
        
    }

}