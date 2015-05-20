App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Question extends App.Model
    defaults: ->
      figures: null
      content: null
      tables : null
      topics : null