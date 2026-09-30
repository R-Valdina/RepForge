<?php
/** This tells PhpStorm that $basePath already exists and is a string. */
/** @var string $basePath */
/** @var AltoRouter $router */

/**
 * Dashboard page.
 *
 * Displays the user's main RepForge dashboard.
 */
?>
<!doctype html>
<html lang="en">
<head>
   <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<?= $basePath ?>css/app.css">
   <title>Dashboard</title>
</head>

<body>
	<?php require_once 'nav_top.php'; ?>
    <div class="page-layout">


	<h1>Dashboard</h1>
	<!-- Put this in the body so it doesn't screw up your head! -->
	<!-- import, import_once, require, and require_once all pour the file right where you use it -->
	<?php require_once 'nav_side.php'; ?>
</body>
</html>

