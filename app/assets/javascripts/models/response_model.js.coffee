App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Response extends App.Model
    defaults: ->
      answered: false
      question: null
      correct: null
      answer: null
      id: null

  class Models.Responses extends App.Collection
    model: Models.Response