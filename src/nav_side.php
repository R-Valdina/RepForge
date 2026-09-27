<?php
/** Navigation to be called repetitively  */
?>

<nav class="main-navigation">
	<a href="<?= $router->generate('dashboard') ?>">Dashboard</a>
	<a href="<?= $router->generate('workoutplan_index') ?>">Workout Plan</a>
	<a href="/repforge/mealplan">Meal Plan</a>
	<a href="/repforge/measurements">Measurements</a>
	<a href="/repforge/macros">Macros</a>
	<a href="/repforge/performance">Performance</a>
	<a href="/repforge/forum">Community</a>
</nav>
