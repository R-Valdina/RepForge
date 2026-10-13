<?php

/** This tells PhpStorm that $basePath already exists and is a string. */
/** @var string $basePath */
/** @var AltoRouter $router */

/**
 * Dashboard page.
 *
 * Displays the user's main RepForge dashboard.
 */

ob_start();
?>

    <h1>Dashboard</h1>

<?php

$content = ob_get_clean();

require_once __DIR__ . '/../app_layout.php';

