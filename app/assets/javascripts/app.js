var zoidbergApp = angular.module('zoidbergApp', [
  'templates',
  'ui.router',
  'ngTouch'
  ]);

zoidbergApp.constant('gon', window.gon || {});

zoidbergApp.run(function($rootScope, $location){
  $rootScope.$on('$stateChangeStart',
    function (event, toState, toParams){
      console.log(toParams)
    });
})
