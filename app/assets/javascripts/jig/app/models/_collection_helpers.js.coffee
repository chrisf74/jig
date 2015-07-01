do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.collectionHelpers = {}

      # ###
      # Load models returned by the servers 'index' action.
      # ###
      # load: (options) ->
      #   # If the collection is already loaded, trigger
      #   # loading event and resolve the promise.
      #     if @loaded is true
      #           @trigger('loaded')
      #           $.Deferred().resolve(@)

      #   # Otherwise, trigger loading event, call fetch
      #   # and return the fetch promise.
      #     else
      #           @trigger('loading')
      #     @fetch(options)
      #       .done(=>
      #         @trigger('loaded')
      #         @loaded = true
      #       )
      #       .fail((args) =>
      #         @trigger('loading:error', args...)
      #       )

      # ###
      # Load model returned by the servers 'show' action.
      # ###
      # loadModel: (id, options) ->
      #   model = @get(id)
      #   add   = false

      #   # If the model is not in the collection, create
      #   # a new one and set the add flag to true.
      #   unless model
      #     model = new @model(id:id)
      #     add   = true

      #   # If the model is already loaded, trigger loaded 
      #   # events.
      #   if model.get('loaded')
      #     model.trigger('loaded')
      #     @trigger('model:loaded', model)

      #   # Otherwise load the model...
      #   else
      #     @trigger('model:loading', model)

      #     # Call model's load method...
      #     model.load(options)
      #       .done(=>
      #         @add(model) if add is true
      #         @trigger('model:loaded', model)
      #       )
      #       .fail((args) =>
      #         @trigger('model:loading:error', model, args...)
      #       )

      #   # Return the model.
      #   model

