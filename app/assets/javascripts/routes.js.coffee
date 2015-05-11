App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Route extends App.Route
    beforeUpdatePageState: ->
      App.jsAppRegion.empty()
    showView: ->
      App.jsAppRegion.show new @view

  class Routes.Home extends Route
    name        : 'home'
    urlPattern  : ''
    view        : App.Views.Home

  class Routes.TopicIndex extends Route
    name      : 'topicIndex'
    urlPattern: 'topics'
    view      : App.Views.TopicIndex
    action    : ->
      @state.topics = App.Models.topics

  class Routes.ShowTopic extends Route
    name        : 'showTopic'
    urlPattern  : 'topics/:topicId'
    view        : App.Views.ShowTopic
    beforeAction: [App.Filters.setNextTopicId]
    action      : ->
      @state.topic = App.Models.topics.get @params.topicId
      @state.subtopicId = @params.subtopicId

  class Routes.ShowSubTopic extends Routes.ShowTopic
    name      : 'showSubTopic'
    urlPattern: 'topics/:topicId/subtopics/:subtopicId'

  class Routes.EditTopic extends Route
    name      : 'editTopic'
    urlPattern: 'topics/:id/edit'
    view      : App.Views.EditTopic

  class Routes.NewTopic extends Route
    name      : 'newTopic'
    urlPattern: 'topics/new'
    view      : App.Views.NewTopic

  new Routes.Home
  new Routes.TopicIndex
  new Routes.ShowTopic
  new Routes.ShowSubTopic
  new Routes.EditTopic
  new Routes.NewTopic