<?php
require 'db/medoo.min.php';  //DB
require 'db/tndb.php';        //DB
require 'flight/Flight.php';  //ROUTES
//require 'routes/profile.php';    //ROUTES
//require 'routes/user.php';    //ROUTES
//require 'routes/group.php';    //ROUTES
require 'routes/product.php';    //ROUTES
require 'routes/project.php';    //ROUTES
require 'routes/category.php';    //ROUTES
require 'routes/destacado.php';    //ROUTES
require 'routes/login.php';    //ROUTES
require 'routes/file.php';    //ROUTES
require 'routes/upload.php';    //ROUTES

Flight::map("setCrossDomainHeaders",function(){
  header("Access-Control-Allow-Headers: Content-Type");
  header("Access-Control-Allow-Origin: *");
  header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
});

Flight::map("callback",function($data){
  //echo $_GET['callback'].'(' . $data . ');';
  header("Access-Control-Allow-Headers: Content-Type");
  header("Access-Control-Allow-Origin: *");
  header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
  echo $data;
  exit;
});

Flight::map("jsoncallback",function($data){
  header("Access-Control-Allow-Headers: Content-Type");
  header("Access-Control-Allow-Origin: *");
  header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
  echo json_encode($data);
  exit;
});

Flight::route("OPTIONS *",function(){
  header("Access-Control-Allow-Headers: Content-Type");
  header("Access-Control-Allow-Origin: *");
  header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
});

Flight::route("OPTIONS /*/*",function(){
  header("Access-Control-Allow-Headers: Content-Type");
  header("Access-Control-Allow-Origin: *");
  header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
});

 
//--------------------------------------------------
Flight::map('error', function(Exception $ex){
    // Handle error
    echo $ex->getTraceAsString();
});
Flight::set('flight.log_errors', true);
Flight::map('notFound', function(){
    Flight::setCrossDomainHeaders();
    echo "Route not found, sorry pal.";
});


// Map a custom method
Flight::map('hello', function($name){
    return "Hello, $name!";
});

Flight::route('/', function(){
    header("Access-Control-Allow-Origin: *");
    echo Flight::hello('Bob');
    echo "API OK";
});

Flight::route('/la', function(){
    header("Access-Control-Allow-Origin: *");
    echo "LO";
});

Flight::start();
?>
