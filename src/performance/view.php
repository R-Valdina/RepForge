<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/**
 * To view performance data.
 *
 *
 */
ob_start();
?>

    <h1>Performance</h1>

<?php

$content = ob_get_clean();

require_once __DIR__ . '/../app_layout.php';



