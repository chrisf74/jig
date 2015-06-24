App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Topics extends App.Route
    urlPattern: 'topics'
    name: 'topics'
    view: App.Topics.Index
    action: ->
      @state.topics = App.topics

  new Routes.Topics

  class Routes.Topic extends App.Route
    urlPattern: 'topics/:topicId'
    name: 'topic'
    view: App.Topics.Show
    action: ->
      @state.topic = App.topics.get(@state.topicId)
      unless @state.topic
        @state.topic = App.topics.add(id: @state.topicId)

  new Routes.Topic