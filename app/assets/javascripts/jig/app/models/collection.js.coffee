do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.Collection extends Backbone.Collection

    ###
    Extend app collection class with collection helpers.
    ###
    _.extend(App.Collection::, App.collectionHelpers)