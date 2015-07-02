App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->

  ###
  Topic Index Layout
  ###
  class Topics.Index extends App.LayoutView
    template: 'topics/topic_index'

    regions:
      topics: '.topics-list'

    initialize: ->
      @collection = @routeState.get('topics')

    showLoading: ->
      console.log 'show:loading'

    showLoaded: ->
      console.log 'show:loaded'

    showError: ->
      console.log 'show:error'

    onRender: ->
      @showLoading()
      @collection.load()
        .done(=> @showLoaded())
        .fail(=> @showError())

  ###
  Topic Index List Item View
  ###
  class Topics.ListItem extends App.ItemView
    template: 'topics/topic_index_list_item'

    tagName: 'li'

  ###
  Topic Index List View
  ###
  class Topics.List extends App.CollectionView
    childView: Topics.ListItem

    tagName: 'ul'
