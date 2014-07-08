function NMSAppController($scope, $rootScope) {

    // $("title").html("Clarity | Flow/Health");


    setTimeout(function(){

        $(".ng-scope").css("max-height",$(window).height());
        $(".ng-scope").css("overflow","auto");
        $(".ui.menu").css("overflow","hidden");

    },3000);

}


function GAppController($scope, $rootScope) {

    $("title").html("GA | Backend");

    $scope.logged = function() {
        return $rootScope.logged;
    }
    $scope.clearLogin = function() {

        setTimeout(function() {
            $scope.$apply(function() {
                $rootScope.logged = false;
            });
        }, 1000);
        console.log("clearlogin!");
        store.set("gausername", "");
        store.set("gapassword", "");
    }

}



//GA LOGIN///////////////////////////

var GaApi = angular.module('GaApiService', ['ngResource'])
    .factory('GaApi', ['$resource', "AppConfig",
        function($resource, AppConfig) {
            return $resource(AppConfig.apiGAProduccion + '/', {}, {
                check: {
                    method: 'GET',
                    isArray: false
                }
            });
        }
    ]);


var GaLogin = angular.module('GaLoginService', ['ngResource'])
    .factory('GaLogin', ['$resource', "AppConfig",
        function($resource, AppConfig) {
            return $resource(AppConfig.apiGAProduccion + '/login/:id', {}, {
                check: {
                    method: 'POST',
                    isArray: false
                }
            });
        }
    ]);

function GaLoginController($scope, $rootScope, GaLogin, NMSHelper, $location,GaApi) {
    $scope.data = {
        username: store.get("gausername") || "",
        password: store.get("gapassword") || ""
    }

    $scope.tryLogin = function() {

/*
        GaApi.check({},function(data){
            console.info("GAPI-TEST->"+JSON.stringify(data));
        });
*/

        GaLogin.check({}, $scope.data, function(data) {
            store.set("gausername", $scope.data.username);
            store.set("gapassword", $scope.data.password);
            console.info("loginvalidation->"+( (data.ok) == true));
            if ( ((data.ok) == true) ) {
                console.info("loginvalidation success");
                $rootScope.logged = true;
                NMSHelper.changeState($scope, $location, "/ga/home", 500);
            } else {
                $('.ui.error.message').fadeIn();
                $('.ui.form')
                    .form("add errors", ["Usuario o contraseña invalidos"]);
                setTimeout(function() {
                    $('.ui.error.message').fadeOut();
                }, 2000);
            }
        }, function() {
            $('.ui.error.message').fadeIn();
            $('.ui.form')
                .form("add errors", ["Problema interno. Contacte administrador."]);
            setTimeout(function() {
                $('.ui.error.message').fadeOut();
            }, 2000);
        });
    }

    $('.ui.form')
        .form({
            username: {
                identifier: 'username',
                rules: [{
                    type: 'empty',
                    prompt: 'Usuario requerido'
                }]
            },
            password: {
                identifier: 'password',
                rules: [{
                    type: 'empty',
                    prompt: 'Password requerida'
                }]
            }
        }, {
            onSuccess: function() {
                $scope.tryLogin();
            },
            onFailure: function() {
                //console.log("fail");
            }
        });


    $scope.tryLogin();
}