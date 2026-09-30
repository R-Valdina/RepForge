<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/**
 * Forums page.
 * Displays a list of forums
 *
 */
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<?= $basePath ?>css/app.css">
    <title>Forums</title>
</head>

<body>
    <?php require_once 'nav_top.php'; ?>

    <h1>Forums</h1>

    <?php require_once 'nav_side.php'; ?>
</body>
</html>