App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Books extends Routes.Route
    name        : 'books'
    urlPattern  : 'books'
    activeTab   : 'books'
    view        : App.Books.Index.View

  new Routes.Books