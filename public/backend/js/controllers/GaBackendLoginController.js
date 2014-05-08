angular.module('GaBackendLoginCtrl', [])
    .controller('GaBackendLoginController'

        , function($scope, $rootScope, Login, $location) {

            $scope.message = "GaBackendLoginController Ready";
            console.log($scope.message);

            $scope.login = function() {
                if (!_.isUndefined($scope.formData["username"]) && !_.isUndefined($scope.formData["password"])) {
                    //console.log("checking");
                    Login.check($scope.formData, function(res) {
                        //console.log(res);
                        if (res.ok == 1) {
                            //log in
                            $rootScope.logged = true;

                            setTimeout(function() {

                                $scope.$apply(function() {
                                    $location.path("/");
                                });
                            }, 1000);
                            //
                        } else {
                            $('.ui.error.message').fadeIn();
                            $('.ui.form')
                                .form("add errors", ["Usuario o contraseña invalidos"]);

                        }
                    });
                }
            }


            $.fn.form.settings.templates.error = function(errors) {
                var html = '<ul class="list">';

                $.each(errors, function(index, value) {
                    html += '<li>' + value + '</li>';
                });
                html += '</ul>';
                return $(html);
            }

            $('.ui.form')
                .form({
                    username: {
                        identifier: 'username',
                        rules: [{
                            type: 'empty',
                            prompt: 'Por favor ingrese un nombre de usuario'
                        }]
                    },
                    password: {
                        identifier: 'password',
                        rules: [{
                            type: 'empty',
                            prompt: 'Por favor ingrese una contraseña'
                        }]
                    }

                });

        });