App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Topic extends App.Model
    defaults: ->
      questions: null
      figures  : null
      content  : null
      tables   : null