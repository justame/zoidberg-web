(function() {
  'use strict'

  zoidbergApp.controller('dashboardCtrl', function($scope, $http) {

    $scope.startAutomaticLikes = function() {
      $http.post('api/job/okcupid', {
        user_website_credential: {
          username: $scope.username,
          password: $scope.password
        }
      }).then(function() {
        alert('sent 100%');
      })
    }
  });
}());