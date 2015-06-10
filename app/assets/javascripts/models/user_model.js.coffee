App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.User extends App.Model
    defaults: ->
      questions: null
      quizzes: null
      topics: null
      email: null
      id: null
      ui: null