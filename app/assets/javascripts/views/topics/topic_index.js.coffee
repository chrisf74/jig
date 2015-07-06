App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->

  ###
  Topic Index Layout
  ###
  class Topics.Index extends App.LayoutView
    template: 'topics/topic_index'

    regions:
      topics: '.topics-list'

    showLoading: ->
      console.log 'show:loading'

    showLoaded: ->
      @showChildView 'topics', new Topics.List
        collection: @routeState.get('topics')

    showError: ->
      console.log 'show:error'

    onRender: ->
      @load(@routeState.get('topics'))

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
