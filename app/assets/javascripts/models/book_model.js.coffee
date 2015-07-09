App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Book extends App.Model
    defaults: ->
      name: null

    url: ->
      "/api/books/#{@id}.json"

    initialize: (attrs, options) ->
      @topics = new Models.Topics(attrs.topics)

    parse: (attrs) ->
      {topics} = attrs
      @topics.add(topics) if @topics and topics
      return attrs

  class Models.Books extends App.Collection
    model: Models.Book

    url: ->
      "/api/books.json"