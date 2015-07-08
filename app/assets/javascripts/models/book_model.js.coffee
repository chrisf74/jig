App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Book extends App.Model
    defaults: ->
      name: null

    url: ->
      "/api/books/#{@id}.json"

    initialize: (attrs) ->
    	@topics = new Models.Topics(attrs.topics)

    parse: (attrs) ->
    	return attrs unless @topics
    	@topics.add(attrs.topics) if attrs.topics
    	return attrs

  class Models.Books extends App.Collection
    model: Models.Book

    url: ->
      "/api/books.json"