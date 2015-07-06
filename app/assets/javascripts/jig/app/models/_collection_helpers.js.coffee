do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.collectionHelpers =

      ###
      Load models via servers 'index' action.
      ###
      load: (options) ->
        @loadPromise or= @fetch(options)
          .done(=> 
            @loaded = true
          )
          .fail(=> 
            @loaded = false
          )

      ###
      Test to see if collection is loaded.
      ###
      isLoaded: ->
        @loaded is true

