var appRoutes = angular.module('appRoutes', ['ui.router']);
appRoutes.config(function($stateProvider, $urlRouterProvider, $httpProvider) {
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
    //
    $urlRouterProvider.otherwise('/home');
    //
    $stateProvider

    .state('home', {
        url: '/home',
        views: {
            '': {
                templateUrl: 'views/ga.layout.html',
                controller: 'GaController'
            }
        }
    })

});

appRoutes.run(function($rootScope, $location, $urlRouter, $state, $timeout) {


});