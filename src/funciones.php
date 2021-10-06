<?php

/**
 * Estees un archivo de funciones generales
 */

/**
 * Esta funcion agrega <pre> para que los debugs se vean mas comodamente
 * @param $var mixed variable que se quiere imprimir en pantalla
 */
function debug_formateado($var)
{
    echo('<pre>');
    var_dump($var);
    echo('</pre>');
}

/**
 * Envia un mensaje al usuario con lo que se quiera
 *
 * @param $tipomensaje String Es la clase de CSS con la que se pinta el div, los defaults son exito, error y advertencia
 * @param $mensaje String El mensaje a mostrar
 */

function mensaje_al_usuario($tipomensaje, $mensaje)
{
    $mensaje_formateado = sprintf('<div class="w3-panel mensaje %s">%s</div>', $tipomensaje, $mensaje);
    
    if (isset($_SESSION['mensaje'])) {
        $_SESSION['mensaje'] .= $mensaje_formateado;
    } else {
        $_SESSION['mensaje'] = $mensaje_formateado;
    }
    
}

/**
 * Imprime el mensaje enviado en mensaje_al_usuario y lo elimina para no mostrarlo denuevo
 */

function mostrar_mensaje()
{
    if (isset($_SESSION['mensaje'])) {
        echo $_SESSION['mensaje'];
        unset($_SESSION['mensaje']);
    }
}

?>