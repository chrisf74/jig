App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Book extends App.Model
    defaults: ->
      name: null

    url: ->
      "/api/books/#{@id}.json"

  class Models.Books extends App.Collection
    model: Models.Book

    url: ->
      "/api/books.json"