<?php
require 'db/medoo.min.php';  //DB
require 'db/tndb.php';        //DB
require 'flight/Flight.php';  //ROUTES
//require 'routes/profile.php';    //ROUTES
//require 'routes/user.php';    //ROUTES
//require 'routes/group.php';    //ROUTES
require 'routes/ga_producto.php';    //ROUTES
require 'routes/category.php';    //ROUTES
require 'routes/destacado.php';    //ROUTES
require 'routes/login.php';    //ROUTES

Flight::map("callback",function($data){
  //echo $_GET['callback'].'(' . $data . ');';
  echo $data;
});

 
Flight::route('/tables', function(){
    TNDB::init();//always.
    $ifnotexists = "IF NOT EXISTS";
    //$ifnotexists = "";
    //--
    TNDB::$ctx->query("CREATE TABLE ".$ifnotexists." tn_node (
      _id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(30),
      description VARCHAR(30),
      tags VARCHAR(100),
      icon VARCHAR(30)
    )");
    //--
    TNDB::$ctx->query("CREATE TABLE ".$ifnotexists." tn_group (
      _id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      description VARCHAR(30)
    )");
    //--
    TNDB::$ctx->query("CREATE TABLE ".$ifnotexists." tn_profile (
      _id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      description VARCHAR(30),
      _group_id INT NOT NULL,
      	FOREIGN KEY (_group_id) REFERENCES tn_group(_id)
    )");
    //--
    TNDB::$ctx->query("CREATE TABLE ".$ifnotexists." tn_user (
      _id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(30),
      pass VARCHAR(30),
      
      _group_id INT NOT NULL,
      FOREIGN KEY (_group_id) 
      REFERENCES ".$tablePrefix."_group(_id),

      _perfil_id INT NOT NULL,
      FOREIGN KEY (_perfil_id) 
      REFERENCES ".$tablePrefix."_perfil(_id) 
    )");
    //--
    

    //TN_Group::add("GA Iluminacion"); //2
    //TN_Profile::add("GA Admin",2); //1
    //TN_Profile::add("GA Cliente",2); //2
    //TN_User::add("garoot","123456",2,1); //2


    echo "Tables Updated !";
});
//--------------------------------------------------
Flight::map('error', function(Exception $ex){
    // Handle error
    echo $ex->getTraceAsString();
});
Flight::set('flight.log_errors', true);
Flight::map('notFound', function(){
    // Handle not found
    echo "NOT FOUND";
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
