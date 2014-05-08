<?php
$root = "/preubas/ga_remake/";
require 'libs/flight/Flight.php';  
Flight::route('/', function(){
    include "site.php";
});
Flight::route('/Collection', function(){
    include "site.php";
});
Flight::map('hello', function($name){
    return "Hello, $name!";
});
Flight::map('error', function(Exception $ex){
    echo $ex->getTraceAsString();
});
Flight::set('flight.log_errors', true);
Flight::map('notFound', function(){
    Flight::redirect($root);
});
Flight::start();
?>
