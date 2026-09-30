<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/**
 * Profile page.
 *
 * Create, edit, and view user profile information.
 */

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<?= $basePath ?>css/app.css">
    <title>User Profile</title>
</head>

<body>
    <?php require_once 'nav_top.php'; ?>

    <h1>User Profile</h1>

    <?php require_once 'nav_side.php'; ?>
</body>
</html>

