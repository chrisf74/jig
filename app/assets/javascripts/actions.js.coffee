App.module "Actions", (Actions, App, Backbone, Marionette, $, _) ->
  class Action extends App.Action
    onShow: ->
      App.jsAppRegion.empty()
      App.pageState.update @state
      App.jsAppRegion.show new @contentView

  class Actions.TopicIndex extends Action
    contentView: App.Views.TopicIndex
    onRun: -> @state.topics = App.Models.topics

  class Actions.ShowTopic extends Action
    contentView: App.Views.ShowTopic

  class Actions.EditTopic extends Action
    contentView: App.Views.EditTopic

  class Actions.NewTopic extends Action
    contentView: App.Views.NewTopic