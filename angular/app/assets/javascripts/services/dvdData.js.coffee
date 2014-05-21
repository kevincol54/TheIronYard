angular.module("Dvd").factory("dvdData", ['$http', ($http) ->
  
  dvdData = 
    data:
      dvds: [
        {
         title: "Loading....",
         content: ""
        }
      ]
    isLoaded: false

  dvdData.loadDvds = (deferred) ->
    console.log "dudeman"
    if dvdData.isLoaded == false
      $http.get('/dvds.json').success( (data) ->
        dvdData.data.dvds = data
        dvdData.isLoaded = true
        console.log "got that shit"
        if deferred
          deferred.resolve()
      ).error( ->
        console.log("didnt work")
        if deferred
          deferred.reject "cant load dvds"
      )
    else
      if deferred
        deferred.resolve()  

  dvdData.createDvd = (formData) ->
    data = 
      dvd:
        title: formData.newDvdTitle
        content: formData.newDvdContent

    $http.post('/dvds.json', data).success( (data) ->
      dvdData.data.dvds.push(data)
      console.log("made dvd")
    ).error( ->
      console.log("failed to make dvd")
    )

    return true


  dvdData.updateDvd = (formData) ->
    console.log "update this motha trucka"
    data = 
      dvd:
        title: formData.newDvdTitle
        content: formData.newDvdContent

    $http.put("/dvds/#{formData.editDvdId}.json", data).success( (data) ->
      console.log("made dvd")
      
    ).error( ->
      console.log("failed to make dvd")
    )
      )



  dvdData.findDvdById = (dvdId) ->
    test = _.findWhere(dvdData.data.dvds, { id: parseInt(dvdId) })
    return test

  return dvdData


])
  