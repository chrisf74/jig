App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->

  ###
  Show Topic View
  ###
  class Topics.Show extends App.ItemView
    template: 'topics/show_topic'

    routeStateEvents:
      'change:topic': 'changeTopic'

    modelEvents:
      'sync': 'render'

    initialize: ->
      @model = @routeState.get('topic')
      @model.fetch()

    changeTopic: ->
      @setModel @routeState.get('topic')
      @model.fetch()
