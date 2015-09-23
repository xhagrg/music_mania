var userServices = angular.module('userServices', ['ngResource']);
userServices.factory('User', ['$resource', function($resource) {    
  return {
    list: $resource('users/:userId.json', {userId: '@id'}, { 
      query: { method: 'GET', params: { }, isArray: true }
    }),
    song: $resource('users/:userId/add_song', {userId: '@id' }, {
      add: { method: 'POST', params: { }} 
    })
  }
}]);

var songServices = angular.module('songServices', ['ngResource']);

songServices.factory('Song', ['$resource', function($resource) {
  return {
    list: $resource('songs/:songId.json', {songId: '@id'}, {
      query: { method: 'GET', paras: { }, isArray: true }
    }),
    current: $resource('songs/current.json', {}, {
      getNext: { method: 'GET', params: { }}
    })
  }
}]);

