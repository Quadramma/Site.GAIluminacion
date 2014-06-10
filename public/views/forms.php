



<form id="formProduct" action="./producto" method="POST" style="display:none">
	<input type="hidden" name="productid" value="" />
</form>

<form id="formProject" action="./proyecto" method="POST" style="display:none">
	<input type="hidden" name="projectid" value="" />
</form>



<div id="descargasModal" class="ui modal" style="
    top: 80px;
    background: white;
    overflow: hidden;
    padding-top: 40px;
">
  <i class="close icon"></i>
  <div class="header" style="
    text-align: center;
">
    Login
  </div>
  <div class="container" style="
    text-align: center;
    max-width: 200px;
">
    
  <form class="form-signin" role="form">
        
        
        <input type="password" class="form-control" placeholder="Contraseña" required="">
        
        <button ng-click="clickLogin();" class="btn btn-mini btn-block"  style="
    font-size: 10px;
    line-height: 0px;
    padding: 15px;
">Descargar</button>
<p style="
    display: none;
">Contraseña incorrecta</p>
      </form>
    
  </div>
  
</div>