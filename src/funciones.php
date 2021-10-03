<?php

function debug_formateado($var)
{
    echo('<pre>');
    var_dump($var);
    echo('</pre>');
}

function mensaje_al_usuario($tipomensaje, $mensaje)
{
    $mensaje_formateado = sprintf('<div class="w3-container mensaje %s">%s</div>', $tipomensaje, $mensaje);
    $_SESSION['mensaje'] .= $mensaje_formateado;
}

function mostrar_mensaje()
{
    if (isset($_SESSION['mensaje'])) {
        echo $_SESSION['mensaje'];
        unset($_SESSION['mensaje']);
    }
}

?>