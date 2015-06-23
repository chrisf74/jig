App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.User extends App.Model
    defaults: ->
      first_name: null
      last_name: null
      email: null
      id: null