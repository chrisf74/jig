App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->

  ###
  Show Topic View
  ###
  class Topics.Show extends App.LayoutView
    template: 'topics/show_topic'

    regions:
      'content': '.topic-content'

    routeStateEvents:
      'change:topic': 'changeTopic'

    showLoadError: ->
      console.log 'show:load:error'

    showLoading: ->
      console.log 'show:loading'

    showLoaded: ->
      @showChildView 'content', new Topics.Content
        model: @routeState.get('topic')

    changeTopic: ->
      @topic.unload() if @topic?
      @topic = @routeState.get('topic')
      @load(@topic)

    onRender: -> 
      @changeTopic()

    onDestroy: ->
      @topic.unload() if @topic?

  ###
  ###
  class Topics.Content extends App.ItemView
    template: 'topics/show_topic_content'
