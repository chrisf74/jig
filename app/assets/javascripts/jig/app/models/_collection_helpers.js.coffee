do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.collectionHelpers =

      ###
      Get model from collection or add model to
      collection.
      ###
      getOrAdd: (id) ->
        model = @get(id) or @add(id:id)

      ###
      Load collection from server if necessary.
      ###
      load: (options) ->
      	if @loaded is true
      		@trigger 'loaded'
      		$.Deferred().resolve(@)
      	else
      		@trigger 'loading'
          @fetch(options).then () =>
            @trigger 'loaded'
            @loaded = true

      ###
      ###
      loadModel: (id, options) ->
        model = @get(id)
        if model
          @trigger 'model:loaded', model
          model.trigger 'loaded'
        else
          model = new @model(id: id)
          @trigger 'loading:model', model
          model.load(options)
            .done(=>
              @trigger 'model:loaded', model
            )

