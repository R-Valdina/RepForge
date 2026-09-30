<?php
/** @var AltoRouter $router */
/** Navigation to be called repetitively  */
?>

<nav class="main-navigation">
	<a href="<?= $router->generate('dashboard') ?>">Dashboard</a>
	<a href="<?= $router->generate('workoutplan_index') ?>">Workout Plan</a>
	<a href="<?= $router->generate('mealplan_index') ?>">Meal Plan</a>
	<a href="<?= $router->generate('measurements_index') ?>">Measurements</a>
	<a href="<?= $router->generate('macros_index') ?>">Macros</a>
	<a href="<?= $router->generate('performance_view') ?>">Performance</a>
	<a href="<?= $router->generate('forum_index') ?>">Community</a>
</nav>
