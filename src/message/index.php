<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/** This is to view a list of messages */

ob_start();
?>

    <h1>Messages</h1>

<?php

$content = ob_get_clean();

require_once __DIR__ . '/../app_layout.php';

