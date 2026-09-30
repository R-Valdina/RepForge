<?php
/** @var AltoRouter $router */
/** Navigation to be called repetitively  */
?>
<header>
<nav class="secondary-navigation">
    <a href="<?= $router->generate('message_index') ?>"> Messaging</a>
	<a href="<?= $router->generate('notification_index') ?>" >Notifications</a>
	<a href="<?= $router->generate('support') ?>" >Support</a>
	<a href="<?= $router->generate('user_view') ?>">Profile</a>
</nav>
</header>
