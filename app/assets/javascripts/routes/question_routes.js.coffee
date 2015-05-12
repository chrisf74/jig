App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Questions extends Routes.Route
    name        : 'questions'
    urlPattern  : 'questions'
    activeTab   : 'questions'
    view        : App.Questions.Index.View

  new Routes.Questions