do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.collectionHelpers =

      ###
      Load models via servers 'index' action.
      ###
      load: (options) ->
        @loadPromise or= @fetch(options)

      ###
      Load model via servers 'show' action.
      ###
      loadModel: (id, options) ->
        model = @get(id)
        add   = false

        # If the model is not in the collection, create
        # a new one and set the add flag to true.
        unless model
          model = new @model(id:id)
          add   = true

        # Add model to collection if it isn't already
        # there and return model's load promise.
        return model.load().done () =>
          @add(model) if add is true

