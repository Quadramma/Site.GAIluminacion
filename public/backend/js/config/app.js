var GApp = angular.module("GApp", [
    "GaBackendCtrl",
    "GaBackendLoginCtrl",
    "GaBackendDestacadoCtrl",
    "LoginService",
    "DestacadoService",
    "appRoutes"
]);

GApp.config(['$httpProvider', '$sceDelegateProvider',
    function($httpProvider, $sceDelegateProvider) {
        $httpProvider.defaults.useXDomain = true;
        $sceDelegateProvider.resourceUrlWhitelist(['self', /^https?:\/\/(cdn\.)?yourdomain.com/]);
        delete $httpProvider.defaults.headers.common['X-Requested-With'];
    }
]);