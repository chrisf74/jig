do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.modelHelpers =

      ###
      ###
      _loadError: false

      ###
      ###
      _loadCalls: 0

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
      ###
      load: (options) ->
        @loadCalls += 1
        @loadPromise or= @fetch(options)
          .fail(=> @_loadError: true)

      ###
      ###
      unload: (options) ->
        if @_loadError
          # Do something.

        if @_loadCalls is 0
          # Do nothing. Throw error?




