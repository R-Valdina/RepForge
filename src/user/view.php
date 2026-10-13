<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/**
 * Profile page.
 *
 * Create, edit, and view user profile information.
 */

ob_start();
?>

    <h1>User Profile</h1>

<?php

$content = ob_get_clean();

require_once __DIR__ . '/../app_layout.php';

