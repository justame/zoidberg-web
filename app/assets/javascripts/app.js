
angular.module('zoidbergApp', [
  'templates',
  'ui.router'
  ]);

angular.module('zoidbergApp').run(function($rootScope, $location){
  $rootScope.$on('$stateChangeStart', 
    function (event, toState, toParams){
      console.log(toParams)
    });
})
    