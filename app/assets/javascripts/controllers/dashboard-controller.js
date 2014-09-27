(function() {
  'use strict'

  zoidbergApp.controller('dashboardCtrl', function($scope, $http, gon) {
    $scope.canAutolike = gon.canAutolike;
    
    $scope.startAutomaticLikes = function() {
      $http.post('jobs/okcupid', {
        user_website_credential: {
          username: $scope.username,
          password: $scope.password
        }
      }).then(function(data) {
        $scope.canAutolike = false;
      })
    }
  });
}());