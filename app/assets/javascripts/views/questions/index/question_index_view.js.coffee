App.module "Questions.Index", (Index, App, Backbone, Marionette, $, _) ->
  class Index.View extends App.LayoutView
    template: 'questions/index/question_index_view'