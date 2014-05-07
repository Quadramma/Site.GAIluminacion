angular.module('GaCtrl', []).controller('GaController', function($scope, $rootScope) {

	$scope.message = "GaController Ready";

	bindReadyBehaviours();
	bindNavMenuLinkActiveOnClick(true);
	bindSmothScroll();

});