App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->
  class Topics.Index extends App.LayoutView
    template: 'topics/topic_index'

    regions:
      topics: '.topics-list'

    onRender: ->
      @showChildView 'topics', new Topics.List
        collection: @routeState.get('topics')


  class Topics.ListItem extends App.ItemView
    template: 'topics/topic_index_list_item'

    tagName: 'li'


  class Topics.List extends App.CollectionView
    childView: Topics.ListItem

    tagName: 'ul'

    collectionEvents:
      'sync': 'render'

    initialize: ->
      @collection.fetch()
