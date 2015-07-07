App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Topic extends App.Model
    defaults: ->
      content: null

    url: ->
      "/api/topics/#{@id}.json"

  class Models.Topics extends App.Collection
    model: Models.Topic

    url: ->
      "/api/topics.json"
