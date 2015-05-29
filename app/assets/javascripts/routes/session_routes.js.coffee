App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.NewSession extends Routes.Route
    name: 'newSession'
    urlPattern: 'login'
    view: App.Sessions.NewView