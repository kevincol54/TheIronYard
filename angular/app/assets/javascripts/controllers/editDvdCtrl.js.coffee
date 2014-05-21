@EditDvdCtrl = ($scope, $routeParams, dvdData, $q, $location) ->
  console.log "kevinkevin"

  $scope.data =
    dvdData: dvdData.data
    currentDvd:
      title: "Loading..."
      content: "" 

  $scope.data.dvdId = $routeParams.dvdId

  $scope.formData = 
    editDvdTitle: ""
    editDvdContent: ""
    editDvdId: $routeParams.dvdId


  $scope.findDvdById = ->
    dvd = _.findWhere(dvdData.data.dvds, { id: parseInt($scope.data.dvdId) })
    $scope.data.currentDvd.title = dvd.title
    $scope.data.currentDvd.content = dvd.content
    $scope.formData.editDvdTitle = dvd.title
    $scope.formData.editDvdContent = dvd.content

  $scope.editPost = ->
    console.log "edit post"
    dvdData.updateDvd($scope.formData)

  $scope.returnHome = ->
    console.log "go home copmp, youre drunk"
    $location.url '/'


  @deferred = $q.defer()
  @deferred.promise.then($scope.findDvdById)
  dvdData.loadDvds(@deferred)