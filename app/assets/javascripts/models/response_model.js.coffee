App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Response extends App.Model

  class Models.Responses extends App.Collection
    model: Models.Response