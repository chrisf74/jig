do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.CachedModel extends Backbone.Model
      cache: {}

      fetch: (options) ->

