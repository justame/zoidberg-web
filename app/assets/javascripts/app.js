
window.mainApp = angular.module('zoidbergApp', [
  'templates',
  'ui.router'
  ]);

window.mainApp.run(function($rootScope, $location){
  $rootScope.$on('$stateChangeStart', 
    function (event, toState, toParams){
      console.log(toParams)
    });
})
    