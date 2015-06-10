App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Question extends App.Model
    defaults: ->
      correctAnswer: null
      figures: null
      content: null
      tables: null
      topics: null
      number: null
      id: null

  class Models.Questions extends App.Collection
    model: Models.Question
