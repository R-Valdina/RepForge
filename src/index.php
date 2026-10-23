<?php declare(strict_types=1);
require_once('vendor/autoload.php');


// Pass directly-hosted files of CERTAIN types through. Should never include php or ini
if (file_exists($_SERVER['SCRIPT_FILENAME'])) {
	$file_ext = pathinfo($_SERVER['SCRIPT_FILENAME'], PATHINFO_EXTENSION);
	if ($file_ext == 'css' || $file_ext == 'png') {
		return;
	}
}

$router = new AltoRouter();
$plates = new \League\Plates\Engine();

$plates->setDirectory(__DIR__);

// WE SHOULD AGREE on a base path or load it from an INI file!
// Not doing this will make things break later
$basePath = '/repforge/';
$router->setBasePath($basePath);

// Share these variables with our Plates templates
$plates->addData([
	'router' => $router,
	'basePath' => $basePath
]);

// This is a route mapping. We will have a bunch of these
$router->map('GET', '', function () {
	global $router, $basePath, $plates;
	echo $plates->render('landing');
}, 'landing');

$router->map('GET', 'notifications', function () {
	global $router, $basePath, $plates;
	echo $plates->render('notifications');
}, 'view_notifications');

$router->map('GET', 'support', function () {
	global $router, $basePath, $plates;
	echo $plates->render('support');
}, 'support');

$router->map('GET', 'forum/', function () {
	global $router, $basePath, $plates;
	echo $plates->render('forum/index');
}, 'forum_index');

$router->map('GET', 'macros/', function () {
	global $router, $basePath, $plates;
	echo $plates->render('macros/index');
}, 'macros_index');

$router->map('GET', 'mealplan/', function () {
	global $router, $basePath, $plates;
	echo $plates->render('mealplan/index');
}, 'mealplan_index');

$router->map('GET', 'measurements/', function () {
	global $router, $basePath, $plates;
	echo $plates->render('measurements/index');
}, 'measurements_index');

$router->map('GET', 'message/', function () {
	global $router, $basePath, $plates;
	echo $plates->render('message/index');
}, 'message_index');

$router->map('GET', 'performance/', function () {
	global $router, $basePath, $plates;
	echo $plates->render('performance/view');
}, 'performance_view');

$router->map('GET', 'user/', function () {
	global $router, $basePath, $plates;
	echo $plates->render('user/view');
}, 'user_view');

$router->map('GET', 'login', function () {
	global $router, $basePath, $plates;
	echo $plates->render('user/login');
}, 'login');

$router->map('GET', 'dashboard', function () {
	global $router, $basePath, $plates;
	echo $plates->render('user/dashboard');
}, 'dashboard');

$router->map('GET', 'workoutplan/', function () {
	global $router, $basePath, $plates;
	echo $plates->render('workoutplan/index');
}, 'workoutplan_index');

$match = $router->match();

if (is_array($match) && is_callable($match['target'])) {

	// We will turn this into plate render commands later
	// For now, just process the static page
	call_user_func_array($match['target'], $match['params']);
	exit;

	// That will look something like:
	// echo( $templates->render("templateName", ['db' => new ReadCapability()]) );

} else {
	require(__DIR__ . '/404.php');
	exit;
}

?>
