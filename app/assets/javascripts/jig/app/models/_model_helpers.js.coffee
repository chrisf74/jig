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
      How many views have called 'load' on this model
      and therefore how many views are using this model.
      ###
      _loadCalls: 0

      ###
      Test to see if model is loaded.
      ###
      isLoaded: ->
        @get('loaded') is true

      ###
      Load model via servers 'show' action.
      ###
      load: (options) ->
        @_loadCalls += 1

        @loadPromise or= @fetch(options)
          .done(=>
            @set(loaded: true)
          )
          .fail(=>
            @set(loaded: false)
          )

      ###
      Unload attributes from model if possible.
      ###
      unload: (options) ->
