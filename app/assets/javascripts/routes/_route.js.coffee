App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Route extends App.Route
    beforeAction: [
      App.Filters.updateApplicationNav
    ]