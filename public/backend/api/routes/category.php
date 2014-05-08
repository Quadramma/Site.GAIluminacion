<?php

//GROUPS

Flight::map('getCategories', function(){
    TNDB::init();//always.
    $collection = TNDB::$ctx->select('ga_category', "*");
    return json_encode($collection);
});

Flight::route('/category', function(){
    Flight::callback(Flight::getCategories());
});

Flight::route('/category/@id:[0-9]+', function($id){
    TNDB::init();//always.
    $collection = TNDB::$ctx->select('ga_category', "*",["_id"=>$id]);
    Flight::callback(json_encode($collection));
});

Flight::route('POST /category/create', function(){
	TNDB::init();//always.
	$description = Flight::request()->data->description;
	if(!isset($description)){
		echo "INVALID POST";
		exit;
	}
	TNDB::$ctx->insert('ga_category', ["description" => $description]);
	Flight::callback(Flight::getCategories());
});

Flight::route('POST /category/update', function(){
	TNDB::init();//always.
	$_id 			= Flight::request()->data->_id;
	$description 	= Flight::request()->data->description;
	if(!isset($description)){
		echo "INVALID POST: ISSET DESCRIPTION";
		//echo "[".$description."][".Flight::request()->data->description."]";
		exit;
	}
	if(!isset($_id)){
		echo "INVALID POST: ISSET _ID";
		exit;
	}
	TNDB::$ctx->update('ga_category', ["description" => $description],["_id" => $_id]);
	Flight::callback(Flight::getCategories());
});

Flight::route('/category/delete', function(){
	TNDB::init();//always.
	$_id = Flight::request()->data->_id;
	if(!isset($_id)){
		echo "INVALID DELETE";
		exit;
	}
	TNDB::$ctx->delete('ga_category', ["_id" => $_id]);
	Flight::callback(Flight::getCategories());
});


?>