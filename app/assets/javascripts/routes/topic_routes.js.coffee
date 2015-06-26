App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->

  ###
  Index
  ###
  class Routes.Topics extends App.Route
    urlPattern: 'topics'

    name: 'topics'

    view: App.Topics.Index

  new Routes.Topics

  ###
  Show
  ###
  class Routes.Topic extends App.Route
    urlPattern: 'topics/:topicId'

    name: 'topic'

    view: App.Topics.Show

  new Routes.Topic