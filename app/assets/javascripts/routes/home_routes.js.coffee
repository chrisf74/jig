App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Home extends App.Route
    name        : 'home'
    urlPattern  : ''
    activeTab   : 'home'
    view        : App.Home.View

  new Routes.Home