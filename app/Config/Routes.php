<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php'))
{
	require SYSTEMPATH . 'Config/Routes.php';
}

/**
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override(function (){ 
	echo view('admin/main_view');
});
$routes->setAutoRoute(true);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
$routes->post('admin/login', 'Admin\AuthController::login');

// admin routes
$routes->group('admin', ['filter' => 'auth'], function ($routes) {
	$routes->group('users', function ($routes) {
		$routes->get('all', 'Admin\AccountController::index');
		$routes->get('show/(:num)', 'Admin\AccountController::show/$1');
		$routes->post('add', 'Admin\AccountController::create');
		$routes->delete('delete/(:num)', 'Admin\AccountController::delete/$1');
		$routes->post('update/(:num)', 'Admin\AccountController::update/$1');
		$routes->post('lock/(:num)', 'Admin\AccountController::lock/$1');
	});	

	$routes->group('posts', function ($routes) {
		$routes->get('all', 'Admin\PostController::index');
	});
});

// user routes
$routes->group('post', function ($routes) {
	$routes->get('all', 'PostController::getPostDataByPage');
	$routes->get('detail', 'PostController::getPostDetail');
});




/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php'))
{
	require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}


