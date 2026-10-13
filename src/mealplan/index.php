<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/** This is to view the list of meal plans */
ob_start();
?>

    <h1>Meal Plan</h1>

<?php

$content = ob_get_clean();

require_once __DIR__ . '/../app_layout.php';

