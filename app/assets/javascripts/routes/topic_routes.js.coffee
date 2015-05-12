App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Topics extends Routes.Route
    name        : 'topics'
    urlPattern  : 'topics'
    activeTab   : 'topics'
    view        : App.Topics.Index.View

  new Routes.Topics