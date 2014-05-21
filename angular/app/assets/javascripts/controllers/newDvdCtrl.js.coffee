@NewDvdCtrl = ($scope, $location, dvdData) ->
  console.log("this is a new dvd")
  $scope.data = dvdData.data
  dvdData.loadDvds(null)

  $scope.formData =
    newDvdTitle: ""
    newDvdContent: ""

  $scope.createDvd = ->
    console.log "george bush"
    dvdData.createDvd($scope.formData)
    $scope.returnHome()

  $scope.returnHome = ->
    console.log "go home bitch"
    $location.url("/")