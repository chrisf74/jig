App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Topic extends App.Model
    defaults: ->
      questions: null
      figures: null
      content: null
      tables: null
      id: null

  class Models.Topics extends App.Collection
    model: Models.Topic

