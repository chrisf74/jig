App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->
  class Topics.Index extends App.LayoutView
    template: 'topics/topic_index'

    regions:
      topics: '.topic-list'

    collectionEvents:
      'request': 'showLoadingView'
      'sync'   : 'showLoadedView'

    initialize: ->
      @collection = @routeState.get('topics')

    showLoadingView: ->
      console.log 'show:loading:view'

    showLoadedView: ->
      @showChildView 'topics', new Topics.IndexList
        collection: @collection

    onRender: ->
      @collection.fetch()

  class Topics.IndexListItem extends App.ItemView
    template: 'topics/topic_index_list_item'

    tagName: 'li'

  class Topics.IndexList extends App.CollectionView
    childView: Topics.IndexListItem

    tagName: 'ul'
