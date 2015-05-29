App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Session extends App.Model
    defaults: ->