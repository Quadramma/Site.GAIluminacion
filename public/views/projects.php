
<div class="padbot20">
		<div class="containerDisabled" style="margin-bottom: -135px;">
			<h2></h2>
		</div>
<section id="proyectos" ng-repeat="currentProjectCategory in projectCategories"  class="padbot20">
		
	<!-- PROJECTS CATEGORY -->
	<!-- CONTAINER -->
	<div >
	<div  class="containerDisabled project-title-container">
		<h3>{{currentProjectCategory.categoryDescription}}</h3>
		
	</div><!-- //CONTAINER --> <!-- PROJECTS SLIDER -->
	<div class="projects-wrapper" data-appear-top-offset="-200" data-animated="fadeInUp">
		<div class="owl-demo owl-carousel projects_slider">

			
			<div ng-repeat="item in currentProjectCategory.projects" class="item" ng-click="projectClick(item);">
				<div class="work_item">
					<div class="work_img">
						<img src="backend/api/uploads/projects/{{item.url}}" alt="" />
						<!--
						<a class="zoom" href="backend/api/uploads/projects/{{item.url}}" rel="prettyPhoto[portfolio1]" ></a>
						-->
					</div>
					<div class="work_description">
						<div class="work_descr_cont">
							<a href="#" ng-click="projectClick(item);" >{{item.name}}</a>
							<!--
							<span><a href="#" ng-click="projectClick(item);">Ver más</a></span>
							-->
						</div>
					</div>
				</div>
			</div>
			

		</div><!-- //PROJECTS SLIDER -->
	</div>
	</div>



</section>
	