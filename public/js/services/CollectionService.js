var collectionServiceModule = angular.module('CollectionServ', ['ngResource'])
    .factory('Collection', ['$resource',
        function($resource) {
            return $resource('backend/api/producto/:id', {}, {
                update: {
                    method: 'PUT',
                    isArray: true
                }
            });
        }
    ]);