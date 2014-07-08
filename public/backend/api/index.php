<?php
require 'db/medoo.min.php';  //DB
require 'db/tndb.php';        //DB
require 'flight/Flight.php';  //ROUTES


require 'routes/newsletter.php';    //ROUTES
require 'routes/product.php';    //ROUTES
require 'routes/project.php';    //ROUTES
require 'routes/category.php';    //ROUTES
require 'routes/destacado.php';    //ROUTES
require 'routes/login.php';    //ROUTES
require 'routes/file.php';    //ROUTES
require 'routes/upload.php';    //ROUTES

Flight::map("setCrossDomainHeaders",function(){
  //header("Access-Control-Allow-Headers: Content-Type");
  //header("Access-Control-Allow-Origin: *");
  //header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
});


Flight::map("jsoncallback",function($data){
  header("Access-Control-Allow-Headers: Content-Type");
  header("Access-Control-Allow-Origin: *");
  header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
  echo json_encode($data);
  exit;
});

Flight::route('GET /', function(){
    Flight::jsoncallback(json_encode(array("gapi"=>"GAPI is sad :(")));
});

Flight::start();
?>
