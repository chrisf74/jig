App.module "Questions.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.View extends App.LayoutView
    template: 'questions/show/question_show_view'