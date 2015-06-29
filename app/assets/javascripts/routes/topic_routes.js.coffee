App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->

  ###
  Index
  ###
  class Routes.Topics extends App.Route
    urlPattern: 'topics'

    name: 'topics'

    view: App.Topics.Index

    action: -> @state.topics = App.topics

  new Routes.Topics

  ###
  Show
  ###
  class Routes.Topic extends App.Route
    urlPattern: 'topics/:topicId'

    name: 'topic'

    view: App.Topics.Show

    action: -> @state.topic = App.topics.getOrAdd(@state.topicId)

  new Routes.Topic