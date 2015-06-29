do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.modelHelpers =

      ###
      Reset model values to defaults.
      ###
      resetToDefaults: (options) ->
        oldAttrs = _.clone(@attributes)
        oldKeys  = _.keys(oldAttrs)

        _.each oldKeys, (key) ->
          oldAttrs[key] = null

        if _.isFunction(@defaults)
          defAttrs = @defaults()
        else
          defAttrs = @defaults

        @set _.extend(oldAttrs, defAttrs)

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
            @set(loaded:true)
            @trigger 'loaded'

