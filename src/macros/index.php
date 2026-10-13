<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/**
 * Displays the macro's page.
 *
 * Supports viewing, creating, and editing user macro data.
 */

ob_start();
?>

    <h1>Macros</h1>

<?php

$content = ob_get_clean();

require_once __DIR__ . '/../app_layout.php';


