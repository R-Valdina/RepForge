<?php declare(strict_types = 1);
require_once('vendor/autoload.php');

// Pass directly-hosted files of CERTAIN types through. Should never include php or ini
if (file_exists($_SERVER['SCRIPT_FILENAME'])) {
    $file_ext = pathinfo($_SERVER['SCRIPT_FILENAME'], PATHINFO_EXTENSION);
    if ($file_ext == 'css' || $file_ext == 'png') {
        return;
    }
}

$router = new AltoRouter();

// WE SHOULD AGREE on a base path or load it from an INI file!
// Not doing this will make things break later
$basePath = '/repforge/';
$router->setBasePath($basePath);


// This is a route mapping. We will have a bunch of these
$router->map('GET', '', function () {
	global $router;
	require 'landing.php';
}, 'landing');

$router->map('GET', 'notifications', function () {
	global $router;
	require 'notifications.php';
}, 'view_notifications');

$router->map('GET', 'support', function () {
	global $router;
	require 'support.php';
}, 'support');

$router->map('GET', 'forum/', function () {
	global $router;
	require 'forum/index.php';
}, 'forum_index');

$router->map('GET', 'macros/', function () {
	require __DIR__ . '/macros/index.php';
});
$router->map('GET', 'mealplan/', function () {
	require __DIR__ . '/mealplan/index.php';
}, 'mealplan_index');
$router->map('GET', 'measurements/', function () {
	require __DIR__ . '/measurements/index.php';
});
$router->map('GET', 'message/', function () {
	require __DIR__ . '/message/index.php';
});
$router->map('GET', 'performance/', function () {
	require __DIR__ . '/performance/view.php';
});
$router->map('GET', 'user/', function () {
	require __DIR__ . '/user/view.php';
});
$router->map('GET', 'login', function () {
	require __DIR__ . '/user/login.php';
});
$router->map('GET', 'dashboard', function () {
	global $router, $basePath;
	require __DIR__ . '/user/dashboard.php';
}, 'dashboard');
$router->map('GET', 'workoutplan/', function () {
	global $router;
	require __DIR__ . '/workoutplan/index.php';
}, 'workoutplan_index');

$match = $router->match();

if( is_array($match) && is_callable( $match['target'] ) ) {

	// We will turn this into plate render commands later
	// For now, just process the static page
	call_user_func_array( $match['target'], $match['params'] );
	exit;

	// That will look something like:
	// echo( $templates->render("templateName", ['db' => new ReadCapability()]) );

} else {
	require (__DIR__ . '/404.php');
	exit;
}

?>
