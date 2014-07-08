<?php

define('GA_NEWSLETTER_ROUTE_ALL', "GET /newsletter");
define('GA_NEWSLETTER_ROUTE_DELETE', "POST /newsletter/delete");
define('GA_NEWSLETTER_ROUTE_SAVE', "POST /newsletter/save");


Flight::route(GA_NEWSLETTER_ROUTE_ALL, function(){
	Flight::setCrossDomainHeaders();
	TNDB::init();
	//
	$items = TNDB::$ctx->select('qm_user', "*",[
			'esBackendUser'=>0
		]);
	//
    Flight::jsoncallback(array(
    		'items'=>$items
    	));
});

Flight::route(GA_NEWSLETTER_ROUTE_DELETE, function(){
	Flight::setCrossDomainHeaders();
	TNDB::init();
	$data = FlightHelper::getData();//data
	$items = TNDB::$ctx->delete('qm_user', [
			'_id'=>$data["_id"]
		]);
    Flight::jsoncallback(array(
    		'ok'=>true
    	));
});

Flight::route(GA_NEWSLETTER_ROUTE_SAVE, function(){
	Flight::setCrossDomainHeaders();
	TNDB::init();
	$data = FlightHelper::getData();//data

	$has = TNDB::$ctx->has('qm_user', [
			'email'=>$data["email"]
		]);

	if($has){
		Flight::jsoncallback(array(
    		'ok'=>false,
    		'error'=>"su email ya fue suscrito"
    	));
	}
	

	$items = TNDB::$ctx->insert('qm_user', [
			'name'=>$data["name"],
			'email'=>$data["email"]
		]);
    Flight::jsoncallback(array(
    		'ok'=>true
    	));
});


?>