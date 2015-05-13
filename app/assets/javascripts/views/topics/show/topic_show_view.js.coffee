App.module "Topics.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.View extends App.LayoutView
    template: 'topics/show/topic_show_view'