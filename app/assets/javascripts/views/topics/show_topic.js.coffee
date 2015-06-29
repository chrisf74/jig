App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->

  ###
  Show Topic View
  ###
  class Topics.Show extends App.ItemView
    template: 'topics/show_topic'

    modelEvents:
      'loading:error': 'showLoadingError'
      'loading'      : 'showLoading'
      'loaded'       : 'showLoaded'

    initialize: ->
      @model = @routeState.get('topic')

    showLoadingError: ->
      console.log 'show:loading:error'

    showLoading: ->
      console.log 'show:loading'

    showLoaded: ->
      console.log 'show:loaded'

    onRender: ->
      @model.load()
