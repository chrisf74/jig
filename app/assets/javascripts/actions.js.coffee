App.module "Actions", (Actions, App, Backbone, Marionette, $, _) ->
  class Actions.TopicIndex extends App.Route
    contentView: App.Views.TopicIndex

  class Actions.ShowTopic extends App.Route
    contentView: App.Views.ShowTopic

  class Actions.EditTopic extends App.Route
    contentView: App.Views.EditTopic

  class Actions.NewTopic extends App.Route
    contentView: App.Views.NewTopic