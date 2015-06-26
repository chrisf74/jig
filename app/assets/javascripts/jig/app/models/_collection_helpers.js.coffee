do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.collectionHelpers =

    	###
    	Load collection model from server if neccessary.
    	###
    	lookup: (id, options) ->
    		promise = $.Deferred()
    		model   = @add(id)
    		if model.get('loaded')
    			@trigger 'model:loaded', model
    			promise.resolve(model)
    		else
    			@trigger 'model:loading', model
    			model.fetch(options).then () =>
    				@trigger 'model:loaded', model
    				promise.resolve(model)
    		promise

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
