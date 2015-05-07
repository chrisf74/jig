App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.TopicIndex extends App.ItemView

  class Views.ShowTopic extends App.ItemView

  class Views.EditTopic extends App.ItemView

  class Views.NewTopic extends App.ItemView