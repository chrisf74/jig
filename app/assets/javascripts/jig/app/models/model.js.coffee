do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.Model extends Backbone.Model

    ###
    Extend app model class with model helpers.
    ###
    _.extend(App.Model::, App.modelHelpers)
