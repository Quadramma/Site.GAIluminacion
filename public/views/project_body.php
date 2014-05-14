<!-- PORTFOLIO -->
<section id="portfolio" ng-controller="SingleProjectController">
	
	<!-- CONTAINER -->
	<div class="container">
		
		<!-- ROW -->
		<div class="row">
			
			<!-- SIDEBAR -->
			<div class="sidebar col-lg-4 col-md-4 pull-right padbot50">
				<!-- TEXT WIDGET -->
				<div class="sidepanel widget_text">
					<div class="single_portfolio_post_title"><?=$project[0]["name"]?></div>
					<div class="single_portfolio_post_subtitle"></div>
					<p><?=$project[0]["description"]?></p>
				</div><!-- //TEXT WIDGET -->
				
				<hr>
				
				<!-- INFO WIDGET -->
				<div class="sidepanel widget_info">
					<ul class="work_info">
					
					</ul>
					
					<ul class="shared">
						<li><a href="https://twitter.com/GAiluminacion" target="_blank" ><i class="fa fa-twitter"></i></a></li>
						<li><a href="https://www.facebook.com/ga.iluminacion.3" target="_blank" ><i class="fa fa-facebook"></i></a></li>
					</ul>
				</div><!-- //INFO WIDGET -->
			</div><!-- //SIDEBAR -->
			
			
			<!-- PORTFOLIO BLOCK -->
			<div class="portfolio_block col-lg-8 col-md-8 pull-left padbot50">
				
				<!-- SINGLE PORTFOLIO POST -->
				<div class="single_portfolio_post clearfix" data-animated="fadeInUp">
					
					<!-- PORTFOLIO SLIDER -->
					<div class="flexslider portfolio_single_slider">
						<ul class="slides">
							<li ng-repeat="slide in slides track by $index">
								<img src="backend/api/uploads/projects_slides/{{slide}}" alt="" />
							</li>
						</ul>
					</div><!-- //PORTFOLIO SLIDER -->
				</div><!-- //SINGLE PORTFOLIO POST -->
			</div><!-- //PORTFOLIO BLOCK -->
		</div><!-- //ROW -->
	</div><!-- //CONTAINER -->
	

</section><!-- //PORTFOLIO -->