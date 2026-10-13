<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/**
 * Notifications page.
 *
 *
 */

ob_start();
?>

    <h1>Notifications</h1>

<?php

$content = ob_get_clean();

require_once __DIR__ . '/app_layout.php';

