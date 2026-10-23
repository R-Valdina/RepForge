<?php
/** this is so we don't repeat the layout on each page instead we call this */

/** @var string $basePath */
/** @var AltoRouter $router */

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

<?= $this->insert('nav_top') ?>

<div class="page-layout">

    <aside class="left-column">

        <div class="navigation-box">
            <?= $this->insert('nav_side') ?>
        </div>

        <div class="widget-box">
            <h2>Widget</h2>
        </div>

    </aside>

    <main class="content-box">
        <?= $this->section('content') ?>
    </main>

</div>

</body>

</html>