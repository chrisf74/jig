App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Quiz extends App.Model
    defaults: ->
      questions: null
      name: null
      id: null
