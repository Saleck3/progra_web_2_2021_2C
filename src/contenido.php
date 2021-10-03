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

<nav class="w3-bar">
    <a class="w3-bar-item w3-button w3-card-4" href="/">Home</a>
    <?php if (isset($_SESSION["usuario"])) {
        echo '<a class="w3-bar-item w3-button w3-card-4" href="/unlog.php">Desloguear</a>';
    } else {
        echo '<a class="w3-bar-item w3-button w3-card-4" href="/login.php">Login</a>';
    }
    ?>
</nav>

<?php
debug_formateado($_SESSION);
mostrar_mensaje();
if (isset($contenido))
    echo $contenido;

?>

</div>
<footer class="w3-container">

</footer>

</body>
</html>

