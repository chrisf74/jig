App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Quiz extends App.Model

  class Models.Quizzes extends App.Collection
    model: Models.Quizzes
