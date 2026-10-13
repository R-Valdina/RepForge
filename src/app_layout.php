<?php
/** this is so we don't repeat the layout on each page instead we call this */

/** @var string $basePath */
/** @var AltoRouter $router */
/** @var string $content */

?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="stylesheet" href="<?= $basePath ?>css/app.css">

    <title>RepForge</title>
</head>

<body>

<?php require_once 'nav_top.php'; ?>

<div class="page-layout">

    <aside class="left-column">

        <div class="navigation-box">
			<?php require_once 'nav_side.php'; ?>
        </div>

        <div class="widget-box">
            <h2>Widget</h2>
        </div>

    </aside>

    <main class="content-box">
		<?= $content ?>
    </main>

</div>

</body>

</html>