App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Topic extends App.Model
    defaults: ->
      questions: null
      figures: null
      content: null
      tables: null
      id: null

    url: ->
      "/api/topics/#{@id}.pagejson"


  class Models.Topics extends App.Collection
    model: Models.Topic

    url: ->
      "/api/topics.pagejson"


  App.topics = new Models.Topics

