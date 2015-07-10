App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->
  class Topics.Show extends App.LayoutView
    template: 'topics/show_topic'

    regions:
      'content': '.topic-content'
      'toc'    : '.topic-toc'

    modelEvents:
      'request': 'showLoadingView'
      'sync'   : 'showLoadedView'

    initialize: ->
      @model = @routeState.get('topic')

    onRender: ->
      @model.fetch()

    showLoadingView: ->
      @showChildView 'content', new App.Views.Loading
      @showChildView 'toc', new App.Views.Loading

    showLoadedView: ->
      @showChildView 'content', new Topics.ShowContent
        model: @model
      @showChildView 'toc', new Topics.ShowToc
        model: @model.book

    routeStateEvents:
      'change:topic': 'changeTopic'

    changeTopic: ->
      @changeModel(@routeState.get('topic'))
      @model.fetch()

  class Topics.ShowContent extends App.ItemView
    template: 'topics/show_topic_content'

  class Topics.ShowToc extends App.ItemView
    template: 'topics/show_topic_toc'
