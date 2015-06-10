App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Quiz extends App.Model
    defaults: ->
      questions: null
      name: null
      id: null

  class Models.Quizzes extends App.Collection
    model: Models.Quizzes
