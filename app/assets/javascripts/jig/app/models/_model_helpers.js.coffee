do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.modelHelpers =

      ###
      Reset model values to defaults.
      ###
      resetToDefaults: (options) ->
        if _.isFunction @defaults
          defaults = @defaults()
        else
          defaults = @defaults
        @set defaults, options

      ###
      Load model from server if necessary.
      ###
      load: (options) ->
        if @get('loaded') is true
          @trigger 'loaded'
          $.Deferred().resolve(@)
        else
          @trigger 'loading'
          @fetch(options).then () =>
            @trigger 'loaded'
