do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.Collection extends Backbone.Collection
