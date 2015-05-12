App.module "Home", (Home, App, Backbone, Marionette, $, _) ->
  class Home.View extends App.ItemView
    template: 'home/home_view'