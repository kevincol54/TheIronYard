@DvdCtrl = ($scope, $location, $routeParams, dvdData, $q) ->
  $scope.data = 
    dvdData: dvdData.data
    currentDvd:
      title: "Loading..."
      content: ""

  $scope.data.dvdId = $routeParams.dvdId
  $scope.title = "Dvd Index"

  $scope.returnHome = ->
    console.log "yoyoyoyoy"
    $location.url("/")

  $scope.findDvdById = ->
    dvd = _.findWhere(dvdData.data.dvds, { id: parseInt($scope.data.dvdId) })
    $scope.data.currentDvd.title = dvd.title
    $scope.data.currentDvd.content = dvd.content

  $scope.editDvd = ->
    $location.url("/dvds/#{$scope.data.dvdId}/edit")

  

  @deferred = $q.defer()
  @deferred.promise.then($scope.findDvdById)
  dvdData.loadDvds(@deferred)

