

<?php


    //echo "<br>REQUIRE DB";
    //DB
    require 'backend/api/db/medoo.min.php';  //DB
    require 'backend/api/db/tndb.php';        //DB
    
    //echo "<br>DB COLLECTION GET";
    //ALWAYS
    TNDB::init();
    //COLLECTION
    $collection  = TNDB::$ctx->select("ga_product"
        , [   "[>]ga_category" => ["_category_id" => "_id"] ]
        , ["ga_product._id"
        ,"ga_product.code"
        ,"ga_product.slider_urls"
        ,"ga_product.name","ga_product._category_id","ga_category.description(categoryDescription)","ga_product.description","url"
        ,"ga_product.specification"]);
    //DESTACADOS
    $my_file = "backend/api/routes/destacados.json";
    $destacados = array();
    if (file_exists($my_file)) {
        $destacados =  json_decode(file_get_contents($my_file));
    }
    //HOME SLIDES
    $my_file = "backend/api/routes/homeslides.json";
    $homeslides = array();
    if (file_exists($my_file)) {
        $homeslides =  json_decode(file_get_contents($my_file));
    }
    
    //POST productid
    $productid = isset($_POST["productid"])?$_POST["productid"]:"";
    //POST projectid
    $projectid = isset($_POST["projectid"])?$_POST["projectid"]:"";

    //SINGLE PRODUCT
    $product = TNDB::$ctx->select('ga_product', "*",["_id"=>$productid]);
    //SINGLE PROJECT
    $project = TNDB::$ctx->select('ga_project', "*",["_id"=>$projectid]);
    
?>






<!DOCTYPE html>
<html ng-app="GApp" ng-controller="GaController">
<head>
    <meta charset="utf-8">
    <title>GA | Iluminacion</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="images/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta charset="utf-8" />
    <!-- STYLES -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
     <link href="css/ga.pluggins.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <!-- FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">   
    <!-- SCRIPTS -->
    <!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
   
 
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="http://underscorejs.org/underscore-min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
   
    <script src="libs/scrollToggle.js" type="text/javascript"></script>
    <script src="libs/jquery.ga.pluggins.min.js" type="text/javascript"></script>
    <script src="js/other/gafront.js" type="text/javascript"></script>
    
    <script src="backend/libs/angular-resource.min.js"></script>
    <script src="backend/libs/angular-ui-router.js"></script>
    
    <!-- <script src="js/services/CollectionService.js"></script>
    -->
    <script src="js/config/app.js"></script>
    <script src="js/controllers/GaController.js"></script>
    
    <!-- -->
    <?php
    echo "<script>";
    echo "db = {};";
    echo "db.collection = JSON.parse('". json_encode($collection)."');";
    echo "db.destacados = JSON.parse('". json_encode($destacados)."');";
    echo "db.homeslides = JSON.parse('". json_encode($homeslides)."');";
    echo "db.projectid  = ".($projectid==""?"null":$projectid).";";
    echo "db.productid  = ".($productid==""?"null":$productid).";";
    
    echo "db.product  = ".($product==""||$product==null?"null":json_encode($product)).";";
    echo "db.project  = ".($project==""||$project==null?"null":json_encode($project)).";";
    echo "</script>";
    ?>
    
</head>