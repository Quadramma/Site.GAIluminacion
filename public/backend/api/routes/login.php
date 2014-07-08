<?php


Flight::route('POST /login', function(){
	TNDB::init();//always.
    //
    $data = FlightHelper::getData();
	$name 	= $data["username"];
	$pass 	= $data["password"];
    $has 	= TNDB::$ctx->has('qm_user', ["AND"=>["name"=>$name,"pass"=>$pass]])?1:0;
    //
    Flight::jsoncallback(array(
    	"ok"=>$has
    	//, "username"=>$name
    	//, "password"=>$pass
    	//, "error" => TNDB::$ctx->error()
        , "data" => $data
    ));
});


?>