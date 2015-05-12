App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Book extends App.Model
    defaults: ->
      questions: null
      figures  : null
      topics   : null
      tables   : null
      name     : null
      toc      : null
      id       : null