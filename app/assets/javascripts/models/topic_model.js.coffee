App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Topic extends App.Model
    defaults: ->
      content: null

    url: ->
      "/api/topics/#{@id}.json"

    initialize: (attrs = {}, options) ->
    	@book = new Models.Book attrs.book

    parse: (attrs) ->
      {book} = attrs
      @book.set(book) if @book and book
      return attrs

  class Models.Topics extends App.Collection
    model: Models.Topic

    url: ->
      "/api/topics.json"
