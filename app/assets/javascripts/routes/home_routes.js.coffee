App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Home extends Routes.Route
    name        : 'home'
    urlPattern  : ''
    activeTab   : 'home'
    view        : App.Home.View

  new Routes.Home