<?php

$root = "/ga_site";

$scrollTo = "";
require 'libs/flight/Flight.php';  
Flight::route('/', function(){
    include "site.php";
});
Flight::route('/home', function(){
    include "site.php";
});
Flight::route('/newsletter', function(){
    include "site.php";
});


Flight::route('/coleccion', function(){
	$scrollTo = "coleccion";
    include "site.php";
});
Flight::route('/proyectos', function(){
	$scrollTo = "proyectos";
    include "site.php";
});
Flight::route('/filosofia', function(){
	$scrollTo = "filosofia";
    include "site.php";
});
Flight::route('/locales', function(){
	$scrollTo = "locales";
    include "site.php";
});
Flight::route('/contacto', function(){
	$scrollTo = "contacto";
    include "site.php";
});



Flight::route('/proyecto', function($id){
    include "project.php";
});
Flight::route('/producto', function($id){
    include "product.php";
});

/*
Flight::route('/backend', function(){
    Flight::redirect($root."backend/index.php");
});
Flight::route('/admin', function(){
    Flight::redirect($root."backend/index.php");
});
Flight::route('/login', function(){
    Flight::redirect($root. "backend/index.php");
});
Flight::route('/panel', function(){
    Flight::redirect($root."backend/index.php");
});
*/



/*
Flight::map('error', function(Exception $ex){
    echo $ex->getTraceAsString();
});
Flight::set('flight.log_errors', true);
*/
Flight::map('notFound', function(){
    Flight::redirect($root);
});

Flight::start();
?>
