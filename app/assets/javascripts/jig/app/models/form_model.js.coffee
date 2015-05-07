do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) -> 
    class App.FormModel extends Backbone.Model
      resetToDefaults: (options) ->
        defaults = @defaults

        if _.isFunction @defaults
          defaults = @defaults()

        @set defaults, options
        return @
