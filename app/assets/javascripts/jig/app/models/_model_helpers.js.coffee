do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.modelHelpers =

      ###
      Reset model values to defaults.
      ###
      resetToDefaults: (options) ->
        oldAttrs = _.clone(@attributes)
        oldKeys  = _.keys(oldAttrs)

        # Nullify all the old model attributes.
        _.each oldKeys, (key) ->
          oldAttrs[key] = null

        # Get default attributes.
        if _.isFunction(@defaults)
          defAttrs = @defaults()
        else
          defAttrs = @defaults

        # Overwrite old attrs with default attrs.
        @set _.extend(oldAttrs, defAttrs)

      ###
      Load model returned from the servers 'show' action.
      ###
      load: (options) ->
        unless @loadPromise?
          @loadPromise = @fetch(options)
            .done(=>
              @loaded = true
              @trigger('loaded')
            )
            .fail((args) =>
              @trigger('loading:error', args...)
            )
        return @loadPromise



      # ###
      # Load model returned from the servers 'show' action.
      # ###
      # load: (options) ->
      #   # If model is already loaded, trigger the loaded 
      #   # event and return the resolved promise.
      #   if @get('loaded') is true
      #     @trigger('loaded')
      #     $.Deferred().resolve(@)

      #   # Otherwise fetch the model from the server and 
      #   # return the fetch promise.
      #   else
      #     @trigger('loading')
      #     @fetch(options)
      #       .done(=>
      #         @set(loaded:true)
      #         @trigger('loaded')
      #       )
      #       .fail(=>
      #         @trigger('loading:error', arguments)
      #       )

