<?php
require_once 'lib/swift_required.php';
//


$data = json_decode(file_get_contents('php://input'),TRUE);

//POST FIELDS
$POST_FIELD_NAME        = "name";
$POST_FIELD_EMAIL       = "email";
////POST VARS
$name                   = $data["name"]; //$_POST[$POST_FIELD_NAME];
$email                  = $data["email"];//$_POST[$POST_FIELD_EMAIL];
//- Configuration --------------------------------
$SMTP_USER              = 'support@gailuminacion.com';//'javi@quadramma.com';         //IMPORTANT
$SMTP_PASS              = 'Ga123456';//"pepe@36834812";                           //IMPORTANT
$SMTP                   = 'mail.f7000115.ferozo.com'; //"smtp.gmail.com";             //IMPORTANT
$SMTP_PORT              = 25; //465;                          //IMPORTANT
$SMTP_SECURITY          = null; //"ssl"; // ssl or null    //IMPORTANT
$SUCCESS_MSG            = "E-mail sended";
$FAILED_MSG             = "E-mail failed. Retry later";
//VALIDATIONS
$NAME_REQUIRED          = "Name required";
$EMAIL_REQUIRED         = "E-mail required";
//MESSAGE
$MSG_TITLE              = 'GA - Subscripcion recibida ' . $name;
$MSG_FROM               = 'support@gailuminacion.com';
$MSG_FROM_NICK          = 'GA';
$MSG_TO                 = $data["to"];                       //IMPORTANT
$MSG_BODY               =  $name . ' se subscribio con el email ' . $email;
//$MSG_ATTACH_FILE_PATH   = '../colpermin.pdf';
//--------------------------------------
//--------------------------------------
//--------------------------------------

//--------------------------------------
//--------------------------------------
//--------------------------------------
$message = "Every thing work just fine mate";
$rta = 0;
$ok = true;
if (empty($name)) {
  $message = $NAME_REQUIRED;
  $ok = false;
}else{
    if (empty($email)) {
      $message = $EMAIL_REQUIRED;
      $ok = false;
    } else{
        $rta = sendMail();
    }
}
//echo($rta);
echo json_encode(array(
	'message'=>$message,
	'ok'=>$ok,
	'rta'=>$rta
	//,'data'=>$data
));


function sendMail(){
    $transport = Swift_SmtpTransport::newInstance($GLOBALS["SMTP"], $GLOBALS["SMTP_PORT"], $GLOBALS["SMTP_SECURITY"])
      ->setUsername($GLOBALS["SMTP_USER"])
      ->setPassword($GLOBALS["SMTP_PASS"]);
    $mailer = Swift_Mailer::newInstance($transport);
    $message = Swift_Message::newInstance($GLOBALS["MSG_TITLE"])
      ->setFrom($GLOBALS["MSG_FROM"] , $GLOBALS["MSG_FROM_NICK"])
      ->setTo($GLOBALS["MSG_TO"],$GLOBALS["MSG_TO"])
      ->setBody($GLOBALS["MSG_BODY"])
     // ->attach(Swift_Attachment::fromPath($GLOBALS["MSG_ATTACH_FILE_PATH"]))
     ;
    $r = $mailer->send($message);
    //
    if($r == 1) return $GLOBALS["SUCCESS_MSG"];
    else        return $GLOBALS["FAILED_MSG"];
}
?>