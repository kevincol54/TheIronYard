# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./services
#= require_tree ./controllers
#= require_tree ./directives
#= require_tree ./filters

Dvd = angular.module("Dvd", ['ngRoute'])

Dvd.config(["$routeProvider", ($routeProvider) ->
  
  $routeProvider.when('/dvds/new', templateUrl: '../assets/newDvd.html', controller: "NewDvdCtrl")

  $routeProvider.when('/dvds/:dvdId', { templateUrl: "../assets/dvd.html", controller: "DvdCtrl"})

  $routeProvider.when('/dvds/:dvdId/edit', { templateUrl: "../assets/editDvd.html", controller: "EditDvdCtrl"})

  $routeProvider.otherwise({ templateUrl: "../assets/index.html", controller: "IndexCtrl"})
])

Dvd.config(['$httpProvider', (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])