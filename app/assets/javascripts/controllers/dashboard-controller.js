(function() {
  'use strict'

  zoidbergApp.controller('dashboardCtrl', function($scope, $http, gon) {
    $scope.inProgress = false;
    $scope.canAutolike = gon.canAutolike;
    $scope.likeTracks = [];

    $scope.startAutomaticLikes = function() {
      $http.post('jobs/okcupid', {
        user_website_credential: {
          username: $scope.username,
          password: $scope.password
        }
      }).then(function(data) {
        $scope.canAutolike = false;
        $scope.inProgress = true;
      })
    }

    $http.get('/like_tracks').then(function(response){
      $scope.likeTracks = response.data;
    })
  });
}());