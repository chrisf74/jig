App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Home extends Routes.Route
    name        : 'home'
    urlPattern  : ''
    view        : App.Home.View
    activeTab   : 'home'

  new Routes.Home