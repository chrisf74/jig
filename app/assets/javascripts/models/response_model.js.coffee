App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Response extends App.Model
    defaults: ->
      isCorrect: null
      answered: false
      question: null
      answer: null
      id: null