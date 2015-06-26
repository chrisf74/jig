do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.Model extends Backbone.Model
    	resetToDefaults: App.modelHelpers.resetToDefaults
