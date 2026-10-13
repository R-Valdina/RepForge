<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/** To view a list of workout plans */

ob_start();
?>

    <h1>Workout Plan</h1>

<?php

$content = ob_get_clean();

require_once __DIR__ . '/../app_layout.php';



