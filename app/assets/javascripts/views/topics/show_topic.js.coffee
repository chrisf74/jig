App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->

  ###
  Show Topic View
  ###
  class Topics.Show extends App.ItemView
    template: 'topics/show_topic'

    initialize: ->
      @model = @routeState.get('topic')

    showError: ->
      console.log 'show:error'

    showLoading: ->
      console.log 'show:loading'

    showLoaded: ->
      console.log 'show:loaded'

    onRender: ->
      @showLoading()
      @model.load()
        .done(=> @showLoaded())
        .fail(=> @showError())
