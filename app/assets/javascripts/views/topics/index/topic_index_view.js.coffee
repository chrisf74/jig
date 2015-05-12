App.module "Topics.Index", (Index, App, Backbone, Marionette, $, _) ->
  class Index.View extends App.LayoutView
    template: 'topics/index/topic_index_view'