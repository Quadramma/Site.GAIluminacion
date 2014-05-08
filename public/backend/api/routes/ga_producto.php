<?
Flight::route('GET /producto', function(){
	TNDB::init();//always.
    Flight::callback(json_encode(
        Flight::getAllProduct()
        ));
});



Flight::route('GET /producto/@id:[0-9]+', function($id){
    TNDB::init();//always.
    $collection = TNDB::$ctx->select('ga_product', "*",["_id"=>$id]);
    Flight::callback(json_encode($collection));
});

Flight::route('DELETE /producto', function(){
    TNDB::init();//always.
    $ok = 1;
    if(!Flight::deleteProduct($id)){
        $ok = 0;
    }
    Flight::callback(json_encode(
         array("ok"=>$ok)   
        ));
    
});

Flight::route('POST /producto', function(){
    TNDB::init();//always.
    $data = FlightHelper::getData();
    $error = "";
    $ok = 0;
    $list = array();
    $addRta = Flight::newProduct(
            $data["code"],
            $data["name"],
            $data["_category_id"],
            $data["url"],
            $data["description"],
            $data["specification"],
            $data["slider_urls"]
        );
    if($addRta["ok"]){
        $ok = 1;
        $list =Flight::getAllProduct();
        $error = $addRta["error"];
    }
    
    Flight::callback(json_encode(array(
        "ok"=>$ok,
        "list" => $list,
        "error" => $error
        )));
});



Flight::route('PUT /producto', function(){
    TNDB::init();//always.
    $data = FlightHelper::getData();
    $error = "";
    $ok = 0;
    $list = array();
    $addRta = Flight::editProduct(
            $data["_id"],
            $data["code"],
            $data["name"],
            $data["_category_id"],
            $data["url"],
            $data["description"],
            $data["specification"],
            $data["slider_urls"]
        );
    if($addRta["ok"]){
        $ok = 1;
        $list =Flight::getAllProduct();
        
    }
    $error = $addRta["error"];
    
    Flight::callback(json_encode(array(
        "ok"=>$ok,
        "list" => $list,
        "error" => $error,
        "postData" => $data,
        "postDataString" => file_get_contents("php://input")
        )));
});













Flight::map("deleteProduct",function(){
    $has = TNDB::$ctx->has("ga_product",['_id' => $_id]);
    if($has){    
      TNDB::$ctx->delete('ga_product', ['_id' => $_id]);
      return true;
    }else{return false;}
});


Flight::map("editProduct",function($_id,$code,$name,$_category_id,$url,$description,$specification,$slider_urls){
    $error = "";
    $ok = true;
    if(TNDB::$ctx->has("ga_product",["_id"=>$_id])){
      if($url == ""){
          if($slider_urls == ""){
              TNDB::$ctx->update('ga_product', ['code' => $code,'name' => $name,'description' => $description,"_category_id"=>$_category_id,
            'specification' => $specification],['_id' => $_id]);  
          }else{
            TNDB::$ctx->update('ga_product', ['code' => $code,'name' => $name,'description' => $description,"_category_id"=>$_category_id,
            'specification' => $specification,"slider_urls" => $slider_urls],['_id' => $_id]);  
          }
      }else{
        if($slider_urls == ""){
          TNDB::$ctx->update('ga_product', ['code' => $code,'name' => $name,'description' => $description,
          "_category_id"=>$_category_id,"url"=>$url,'specification' => $specification],['_id' => $_id]);
        }else{
          TNDB::$ctx->update('ga_product', ['code' => $code,'name' => $name,'description' => $description,
          "_category_id"=>$_category_id,"url"=>$url,'specification' => $specification,"slider_urls" => $slider_urls],['_id' => $_id]);
        }          
      }
      
      return true;
    }else{
        $error = "Product ID " . $_id . " not found";
        $ok = false;
    }
    return array("ok"=>$ok,"error"=>$error);
});


Flight::map("newProduct",function($code,$name,$_category_id,$url,$description,$specification,$slider_urls){
   $error = "";
   $ok = true;
    $id = -1;
    if(!TNDB::$ctx->has("ga_product",["name"=>$name])){
      TNDB::$ctx->insert('ga_product', [
        'code' => $code,
        'name' => $name,
        'description' => $description,
        "_category_id"=>$_category_id,
        "url"=>$url,
        'specification' => $specification,
        "slider_urls" => $slider_urls
        ]);
      $id  = TNDB::$ctx->max("ga_product","_id");
    }else{
            $error="Existe un producto con el mismo nombre";
            $ok = false;
        }
    //----
    return array("id"=>$id,"error"=>$error, "ok"=>$ok);
});



Flight::map("getAllProduct",function(){
       $collection  = TNDB::$ctx->select("ga_product"
        , [   "[>]ga_category" => ["_category_id" => "_id"] ]
        , ["ga_product._id"
        ,"ga_product.code"
        ,"ga_product.slider_urls"
        ,"ga_product.name","ga_product._category_id","ga_category.description(categoryDescription)","ga_product.description","url"
        ,"ga_product.specification"]);
          return $collection;
});


?>