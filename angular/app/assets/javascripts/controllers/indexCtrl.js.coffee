@IndexCtrl = ($scope, $location, $http, dvdData) ->
  $scope.title = "DVD Index"
  $scope.data = dvdData.data 

  $scope.viewDvd = (dvdId) ->
    console.log "mother trucka"
    $location.url("/dvds/#{dvdId}")
    
  $scope.createNewDvd = ->
    console.log("work bitch")
    $location.url("/dvds/new")

  console.log(dvdData)
  dvdData.loadDvds(null)

