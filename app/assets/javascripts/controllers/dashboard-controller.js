(function() {
  'use strict'

  zoidbergApp.controller('dashboardCtrl', function($scope, $http, gon) {
    $scope.workerStatus = gon.workerStatus;
    
    $scope.startAutomaticLikes = function() {
      $http.post('jobs/okcupid', {
        user_website_credential: {
          username: $scope.username,
          password: $scope.password
        }
      }).then(function(data) {
        $scope.workerStatus = 'running';
      })
    }
  });
}());