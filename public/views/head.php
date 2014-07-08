<?php
    function getJsonAsArray($filename){
        $my_file = $filename;
        $collection = array();
        if (file_exists($my_file)) {
          $collection =  json_decode(file_get_contents($my_file));
          }else{
            $handle = fopen($my_file, 'w') or die('Cannot open file:  '.$my_file);
            fclose($handle);
          }
        return $collection;
    }

    function GetFiles($path){
      $rta = array();
      if ($handle = opendir($path)) {
        while (false !== ($entry = readdir($handle))) {
            if ($entry != "." && $entry != "..") {
                if (strpos($entry,'.') !== false) {
                    $rta [] = $entry;
                }else{
                    
                }
            }
        }
        closedir($handle);
      }
      return $rta;
    }

    //echo "<br>REQUIRE DB";
    //DB
    require 'backend/api/db/medoo.min.php';  //DB
    require 'backend/api/db/tndb.php';        //DB
    
    //echo "<br>DB COLLECTION GET";
    //ALWAYS
    TNDB::init();
    //COLLECTION
    $collection  = TNDB::$ctx->select("ga_product"
        , [   "[><]ga_category" => ["_category_id" => "_id"] ]
        , ["ga_product._id"
            ,"ga_product.code"
            ,"ga_product.slider_urls"
            ,"ga_product.name"
            ,"ga_product._category_id"
            ,"ga_category.description(categoryDescription)"
            ,"ga_product.description"
            ,"url"
            ,"ga_product.details1"
            ,"ga_product.details2"
            ,"ga_product.details3"
        ]);

   // $col = array();
    for ($i=80 ; $i < 81 ; $i++ ) { 
       // $col[] = $collection[$i];
    }

    //PROJECT
    $projects  = TNDB::$ctx->select("ga_project"
        , [   "[><]ga_category" => ["_category_id" => "_id"] ]
        , [
            "ga_project._id"
           ,"ga_project._category_id"
            ,"ga_project.name"
         //   ,"ga_project.description"
            ,"ga_project.url"
            ,"ga_project.slider_urls"
            ,"ga_category.description(categoryDescription)"
        ]);
    

    
    //POST productid
    $productid = isset($_POST["productid"])?$_POST["productid"]:"";
    //POST projectid
    $projectid = isset($_POST["projectid"])?$_POST["projectid"]:"";

    //SINGLE PRODUCT
    $product = TNDB::$ctx->select('ga_product', "*",["_id"=>$productid]);
    //SINGLE PROJECT
    $project = TNDB::$ctx->select('ga_project', "*",["_id"=>$projectid]);

    //DESTACADOS
    $destacados = getJsonAsArray("backend/api/destacados.json");
    //HOME SLIDES
    $homeslides = getJsonAsArray("backend/api/home_slides.json");
    //HOME TEXTS
    $hometexts = getJsonAsArray("backend/api/home_text.json");

   
?>
<!DOCTYPE html>
<html ng-app="GApp" ng-controller="GaController">
<head>
    <meta charset="utf-8">
    <title>GA | Iluminacion Lamparas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="GA iluminacion es una empresa dedicada a la comercialización de luminarias de diseño exclusivo y de calidad internacional. Importadores de lámparas y arañas de Cristal de Bohemia en Argentina y Uruguay. Importador de objetos de decoración, cuadros pintados a mano y esculturas. Diseño de iluminación para proyectos residenciales y profesionales. Asesoramientos en domicilio. Fabricación de modelos a medida, bajo requerimientos especiales. Muebles, mesas bajas de costado y consolas.">
    <meta name="keywords" content="ga iluminacion empresa lamparas">
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

<!--
  <link href="backend/css/semantic.min.css" rel="stylesheet" type="text/css" />
    <script src="backend/lib/semantic.min.js"></script>
-->

    <script src="http://underscorejs.org/underscore-min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
    <script src="backend/lib/angular-resource.min.js"></script>
   
    <script src="libs/scrollToggle.js" type="text/javascript"></script>
    <script src="libs/jquery.ga.pluggins.min.js" type="text/javascript"></script>
   

   <!-- -->
    <?php
        echo "<script>";
        echo "db = {};";
        echo "db.collectionCount = " . count($collection) . ";";        
        //
       // echo "var colJSON = '" . addslashes(json_encode($collection)) . "';";
        
        echo "db.collection = JSON.parse('".addslashes(json_encode($collection))."');";
        echo "db.projects = JSON.parse('". addslashes(json_encode($projects))."');";
        echo "db.destacados = JSON.parse('". addslashes(json_encode($destacados))."');";
        echo "db.homeslides = JSON.parse('". addslashes(json_encode($homeslides))."');";
        echo "db.projectid  = ".($projectid==""?"null":$projectid).";";
        echo "db.productid  = ".($productid==""?"null":$productid).";";
        echo "db.hometexts = JSON.parse('". addslashes(json_encode($hometexts))."');";
        

        echo "db.newsletter = JSON.parse('". addslashes(json_encode(getJsonAsArray("backend/api/newsletter.json"))) ."');";
        echo "db.newsletterFiles = JSON.parse('" 
            . addslashes(json_encode(GetFiles("backend/api/uploads/newsletter"))) ."');";
        //echo "db.scrollTo   = '$scrollTo';";
        //
       //ob_end_clean();
        //echo "db.product  = ".($product==""||$product==null?"null":"JSON.parse('".addslashes(json_encode($product))."')"  ).";";
       //exit;

        echo "db.product  = ".($product==""||$product==null?"null":"JSON.parse('".addslashes(json_encode($product))."')"  ).";";
        echo "db.project  = ".($project==""||$project==null?"null":"JSON.parse('".addslashes(json_encode($project))."')"  ).";";
        echo "</script>";
    ?>

    <script src="js/other/gafront.js" type="text/javascript"></script>
    
    
    <!-- <script src="js/services/CollectionService.js"></script>

<script src="backend/libs/angular-resource.min.js"></script>
    <script src="backend/libs/angular-ui-router.min.js"></script>
    
    <script src="js/config/app.js"></script>
    <script src="js/controllers/GaController.js"></script>
    -->
    <script src="js/controllers/GaController.js"></script>
    
    
 
    
</head>