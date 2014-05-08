var module1 = angular.module('LoginService', ['ngResource'])
    .factory('Login', ['$resource',
        function($resource) {
            return $resource('api/login/:id', {}, {
                check: {
                    method: 'POST',
                    isArray: false
                }
            });
        }
    ]);