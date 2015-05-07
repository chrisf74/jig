App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Topic extends App.Model

  class Models.Topics extends App.Collection
    model: Models.Topic

  Models.topics = new Models.Topics window.topics
  delete window.topics
