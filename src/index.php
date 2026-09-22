<?php declare(strict_types = 1);
require_once('vendor/autoload.php');

$router = new AltoRouter();

// WE SHOULD AGREE on a base path, or load it from a .ini file!
// Not doing this will make things break later
$router->setBasePath('/repforge/');


// This is a route mapping. We will have a bunch of these
$router->map('GET', 'landing', function () {
	require __DIR__ . '/landing.php';
});
$router->map('GET', 'navigation', function () {
	require __DIR__ . '/navigation.php';
});
$router->map('GET', 'notifications', function () {
	require __DIR__ . '/notifications.php';
});
$router->map('GET', 'support', function () {
	require __DIR__ . '/support.php';
});
$router->map('GET', 'forum', function () {
	require __DIR__ . '/forum/index.php';
});
$router->map('GET', 'macros', function (){
	require __DIR__ . '/macros/index.php';
});
$router->map('GET', 'mealplan', function (){
	require __DIR__ . '/mealplan/index.php';
});
$router->map('GET', 'measurements', function (){
	require __DIR__ . '/measurements/index.php';
});
$router->map('GET', 'message', function (){
	require __DIR__ . '/message/index.php';
});
$router->map('GET', 'performance', function (){
	require __DIR__ . '/performance/view.php';
});
$router->map('GET', 'user', function (){
	require __DIR__ . '/user/view.php';
});
$router->map('GET', 'login', function (){
	require __DIR__ . '/user/login.php';
});
$router->map('GET', 'dashboard', function (){
	require __DIR__ . '/user/dashboard.php';
});
$router->map('GET', 'workoutplan', function (){
	require __DIR__ . '/workoutplan/index.php';
});

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
