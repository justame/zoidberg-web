'use strict';

mainApp.config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise("/dashboard");
  //
  // Now set up the states
  $stateProvider
    .state('main', {
      abstract: true,
      templateUrl: "main.html"
    })
    .state('main.dashboard', {
      url: "/dashboard",
      templateUrl: "dashboard.html"
    });
});
