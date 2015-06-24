App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->

  ###
  Show Topic View
  ###
  class Topics.Show extends App.ItemView
    template: 'topics/show_topic'

    routeStateEvents:
      'change:topic': 'showContent'

    modelEvents:
      'sync': 'render'

    showTopic: ->
      @model = @routeState.get('topic')
      @model.fetch()

    onRender: ->
      @showContent()
