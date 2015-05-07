App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.TopicIndex extends App.Route
    name      : 'topicIndex'
    urlPattern: 'topics'
    action    : App.Actions.TopicIndex

  class Routes.ShowTopic extends App.Route
    name      : 'showTopic'
    urlPattern: 'topics/:id'
    action    : App.Actions.ShowTopic

  class Routes.ShowSubTopic extends App.Route
    name      : 'showSubTopic'
    urlPattern: 'topics/:topicId/subtopics/:id'
    action    : App.Actions.ShowTopic

  class Routes.EditTopic extends App.Route
    name      : 'editTopic'
    urlPattern: 'topics/:id/edit'
    action    : App.Actions.EditTopic

  class Routes.NewTopic extends App.Route
    name      : 'newTopic'
    urlPattern: 'topics/new'
    action    : App.Actions.NewTopic