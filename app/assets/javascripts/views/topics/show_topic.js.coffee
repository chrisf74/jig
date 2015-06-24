App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->
  class Topics.Show extends App.ItemView
    template: 'topics/show_topic'

    modelEvents:
      'sync': 'render'

    initialize: ->
      @model = @routeState.get('topic')
      @model.fetch()
