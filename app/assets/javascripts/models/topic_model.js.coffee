App.module "Models", (Models, App, Backbone, Marionette, $, _) ->

  ###
  Topic Model
  ###
  class Models.Topic extends App.Model
    defaults: ->
      content: null
      loaded: false

    url: ->
      "/api/topics/#{@id}.json"

    validate: ->
      unless @get('id')
        type: 'no:id'
      unless @get('name')
        type: 'no:name'
      unless @get('book_id')
        type: 'no:book_id'

  ###
  Topics Collection
  ###
  class Models.Topics extends App.Collection
    model: Models.Topic

    loaded: false

    url: ->
      "/api/topics.json"

  ###
  Topics instance
  ###
  App.topics = new Models.Topics
