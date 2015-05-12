App.module "Application", (Application, App, Backbone, Marionette, $, _) ->
  class Application.Nav extends App.ItemView
    template: 'application/application_nav_view'