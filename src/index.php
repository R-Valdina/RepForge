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
	global $router, $basePath;
	require 'landing.php';
}, 'landing');

$router->map('GET', 'notifications', function () {
	global $router, $basePath;
	require 'notifications.php';
}, 'view_notifications');

$router->map('GET', 'support', function () {
	global $router, $basePath;
	require 'support.php';
}, 'support');

$router->map('GET', 'forum/', function () {
	global $router, $basePath;
	require 'forum/index.php';
}, 'forum_index');

$router->map('GET', 'macros/', function () {
	global $router, $basePath;
	require 'macros/index.php';
}, 'macros_index');

$router->map('GET', 'mealplan/', function () {
	global $router, $basePath;
	require 'mealplan/index.php';
}, 'mealplan_index');

$router->map('GET', 'measurements/', function () {
	global $router, $basePath;
	require 'measurements/index.php';
}, 'measurements_index');

$router->map('GET', 'message/', function () {
	global $router, $basePath;
	require 'message/index.php';
}, 'message_index');

$router->map('GET', 'performance/', function () {
	global $router, $basePath;
	require 'performance/view.php';
}, 'performance_view');

$router->map('GET', 'user/', function () {
	global $router, $basePath;
	require 'user/view.php';
}, 'user_view');

$router->map('GET', 'login', function () {
	global $router, $basePath;
	require 'user/login.php';
}, 'login');

$router->map('GET', 'dashboard', function () {
	global $router, $basePath;
	require 'user/dashboard.php';
}, 'dashboard');

$router->map('GET', 'workoutplan/', function () {
	global $router, $basePath	;
	require 'workoutplan/index.php';
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
