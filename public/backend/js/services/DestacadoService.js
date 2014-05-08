var module2 = angular.module('DestacadoService', ['ngResource'])
    .factory('Destacado', ['$resource',
        function($resource) {
            return $resource('api/destacado', {}, {
                update: {
                    method: 'POST',
                    isArray: false
                }
            });
        }
    ]);