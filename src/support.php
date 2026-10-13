<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/**
 * Support page.
 *
 * Create and submit support requests.
 */

ob_start();
?>

    <h1>Support</h1>

<?php

$content = ob_get_clean();

require_once __DIR__ . '/app_layout.php';
