<?php
 /**
  *
  * Eeste archivo se encarga de imprimir la pagina,los mensajes y normaliza el header y footer
  * Lo que se quiera imprimir desde PHP tiene que estar en la variable $contenido como texto
  * */
?>


<!DOCTYPE html>
<html>
<title><?= $titulo ?></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css">
<link rel="stylesheet" href="/css/estilos.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="/images/unlam_logo.png" type="image/x-icon">

<body class="background w3-display-container w3-opacity-min">

<nav class="w3-bar w3-black w3-border-bottom w3-xlarge">
    <a class="w3-bar-item w3-button w3-button w3-mobile" href="/">Home</a>
    <?php if (isset($_SESSION["usuario"])) {
        echo '<a class="w3-bar-item w3-button w3-button w3-mobile" href="/unlog.php">Desloguear</a>';
    } else {
        echo '<a class="w3-bar-item w3-button w3-button w3-mobile" href="/login.php">Login</a>';
    }
    ?>
</nav>
<header class="w3-display-container w3-content w3-hide-small" style="max-width:1500px">
  <img class="w3-image" src="/images/fondo.jpg" alt="Space" width="1500" height="700">
  <div class="w3-display-middle" style="width:65%">
<?php
//debug_formateado($_SESSION);
mostrar_mensaje();
if (isset($contenido))
    echo $contenido;
?>

</div>
<footer class="w3-container">

</footer>

</body>
</html>

