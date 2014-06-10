<!-- CONTAINER -->
<section id="contacto" >
<div class="containerDisabled" >
	
	<!-- ROW -->
	<!--
		data-appear-top-offset="-200" data-animated="fadeInUp"
	-->
	<div class="row"  ng-controller="ContactController">
		
		<div class="col-lg-4 col-md-4 col-sm-6 padbot30">
			<h4>Nuestros destacados</h4>
			<div ng-repeat="item in items track by $index" class="recent_posts_small clearfix">
				<div class="post_item_img_small">
					<img src="backend/api/uploads/products/{{item.url}}" alt="" />
				</div>
				<div class="post_item_content_small">
					<a class="title" href="#" ng-click="clickDestacado(item);" >{{item.name}}</a>
					<ul class="post_item_inf_small">
						<li>{{item.code}}</li>
						<li>{{item.details1}}</li>
						<li>{{item.details2}}</li>
						<li>{{item.details3}}</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="col-lg-4 col-md-4 col-sm-6 padbot30 foot_about_block">
			<h4>GA Iluminacion</h4>
			<p>GA Iluminación esta dedicada al diseño, producción e importación de luminarias exclusivas. Todos los productos son el fruto de inspiración y exploración de culturas y lugares recorridos durante largos años para descubrir lo distinto alrededor del mundo.</p>
			
			<ul class="social">
				<li><a href="https://twitter.com/GAiluminacion" target="_blank"><i class="fa fa-twitter"></i></a></li>
				<li><a href="https://www.facebook.com/ga.iluminacion.3" target="_blank" ><i class="fa fa-facebook"></i></a></li>
				<!--
				<li><a href="javascript:void(0);" ><i class="fa fa-google-plus"></i></a></li>
				<li><a href="javascript:void(0);" ><i class="fa fa-pinterest-square"></i></a></li>
				<li><a href="javascript:void(0);" ><i class="map_show fa fa-map-marker"></i></a></li>
				-->
			</ul>
		</div>
		
		<div class="respond_clear"></div>
		
		<div class="col-lg-4 col-md-4 padbot30">
			<h4>Contactanos</h4>
			
			<!-- CONTACT FORM -->
			<div class="span9 contact_form">
				<div id="note"></div>
				<div id="fields">
					<form id="contact-form-face" class="clearfix" action="#">
						<input type="text" name="name" value="Nombre" onFocus="if (this.value == 'Nombre') 
						this.value = '';" onBlur="if (this.value == '') this.value = 'Nombre';" />
						<textarea name="message" onFocus="if (this.value == 'Mensaje') this.value = '';" onBlur="if (this.value == '') this.value = 'Mensaje';">Mensaje</textarea>
						<input class="contact_btn" type="button" value="Enviar mensaje" />
					</form>
				</div>
			</div><!-- //CONTACT FORM -->
		</div>
	</div><!-- //ROW -->
</div><!-- //CONTAINER -->
</section>