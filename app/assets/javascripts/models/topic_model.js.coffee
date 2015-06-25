App.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  ###
  Topic Model
  ###
  class Models.Topic extends App.Model
    defaults: ->
      content: null
      book_id: null
      name: null
      id: null

    url: ->
      "/api/topics/#{@id}.json"

  ###
  Topics Collection
  ###
  class Models.Topics extends App.Collection
    model: Models.Topic

    url: ->
      "/api/topics.json"

  ###
  Topics instance
  ###
  App.topics = new Models.Topics
