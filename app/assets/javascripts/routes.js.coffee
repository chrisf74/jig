App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Home extends App.Route
    name        : 'home'
    urlPattern  : ''
    view        : App.Views.Home
    beforeAction: ['bar']

  # class Routes.TopicIndex extends App.Route
  #   name      : 'topicIndex'
  #   urlPattern: 'topics'
  #   action    : App.Actions.TopicIndex

  # class Routes.ShowTopic extends App.Route
  #   name      : 'showTopic'
  #   urlPattern: 'topics/:topicId'
  #   action    : App.Actions.ShowTopic

  # class Routes.ShowSubTopic extends App.Route
  #   name      : 'showSubTopic'
  #   urlPattern: 'topics/:topicId/subtopics/:subtopicId'
  #   action    : App.Actions.ShowTopic

  # class Routes.EditTopic extends App.Route
  #   name      : 'editTopic'
  #   urlPattern: 'topics/:id/edit'
  #   action    : App.Actions.EditTopic

  # class Routes.NewTopic extends App.Route
  #   name      : 'newTopic'
  #   urlPattern: 'topics/new'
  #   action    : App.Actions.NewTopic

  new Routes.Home
  # new Routes.TopicIndex
  # new Routes.ShowTopic
  # new Routes.ShowSubTopic
  # new Routes.EditTopic
  # new Routes.NewTopic