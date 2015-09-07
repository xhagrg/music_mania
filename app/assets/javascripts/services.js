var userServices = angular.module('userServices', ['ngResource']);
userServices.factory('User', ['$resource', function($resource) {    
  return $resource('users/:userId.json', {}, { 
    query: { method: 'GET', params: { }, isArray: true } 
  });}                        
]);
