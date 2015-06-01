App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.User extends App.Model
    defaults: ->
      responses: null
      quizzes: null
      email: null
      id: null
      ui: null