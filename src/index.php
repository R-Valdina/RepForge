<?php declare(strict_types = 1);
require_once('vendor/autoload.php');

$router = new AltoRouter();

// WE SHOULD AGREE on a base path, or load it from a .ini file!
// Not doing this will make things break later
$router->setBasePath('/repforge/');


// This is a route mapping. We will have a bunch of these
$router->map('GET', '', function () {
	require __DIR__ . '/landing.php';
});


$match = $router->match();

if( is_array($match) && is_callable( $match['target'] ) ) {

	// We will turn this into plates render commands later
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
