<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/**
 * Forums page.
 * Displays a list of forums
 *
 */
ob_start();
?>

    <h1>Forums</h1>

<?php

$content = ob_get_clean();

require_once __DIR__ . '/../app_layout.php';

