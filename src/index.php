<?php
session_start();
if (isset($_SESSION["debug"])) {
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
}
include_once("config/Configuration.php");

$module = isset($_GET["module"]) ? $_GET["module"] : "home";
$action = isset($_GET["action"]) ? $_GET["action"] : "show";

$configuration = new Configuration();
$router = $configuration->createRouter("createHomeController", "show");

$router->executeActionFromModule($module, $action);

