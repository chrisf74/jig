App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Book extends App.Model
    defaults: ->
      questions: null
      topics: null
      name: null
      id: null

  class Models.Books extends App.Collection
    model: Models.Book