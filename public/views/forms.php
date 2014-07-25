



<form id="formProduct" action="./producto" method="POST" style="display:none">
	<input type="hidden" name="productid" value="" />
</form>

<form id="formProject" action="./proyecto" method="POST" style="display:none">
	<input type="hidden" name="projectid" value="" />
</form>



<div id="descargasModal" class="newsletter ui modal">
  <i class="close icon"></i>
  

   <div class="newsletter list form container" ng-controller="NewsletterList">
      <p>Material exclusivo</p>
      <ul class="newsletter list">
        <li ng-repeat="pdf in pdfList" class="newsletter-li">
            <a href="backend/api/uploads/newsletter/{{pdf}}" target="_blank">
              {{pdf}}
            </a>
        </li>
      </ul>
    </div>

<div class="newsletter login">
     <div class="newsletter header">
<p>Usted puede suscribirse completando su nombre, apellido y un email. Le enviaremos un password
para acceder a nuestro material especial.</p>
  </div>
  
  <div class="newsletter form container">

 

    <p>Login</p>
    <form class="form-signin" role="form">
        <input type="password" class="form-control" placeholder="Contraseña" required="">  
        <button ng-click="clickLogin();" class="newsletter form login acceder btn btn-mini btn-block">Acceder</button>
        <p class="newsletter form acceder errors">Contraseña incorrecta</p>
    </form>
    <br>
    <br>


   


    
    <br>
    <br>
    <p>Subscripcion</p>
    <form class="form-subscribe" role="form" ng-controller="SubscribeController">
        <input type="text" class="subscribe name form-control" placeholder="Nombre y Apellido" required="">  
        <input type="text" class="subscribe email form-control" placeholder="Email" required="Email requerido">  
        <button ng-click="subscribe();" class="newsletter form login acceder btn btn-mini btn-block">Suscribirse</button>
        <p class="newsletter form subscribe events">Datos enviados</p>
    </form>
  </div>
   
</div>
</div>