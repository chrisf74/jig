App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->
  class Topics.Index extends App.LayoutView
    template: 'topics/topic_index'

    regions:
      topics: '.topic-list'

    onRender: ->
      topics = @routeState.get('topics')
      topics.fetch()
        .done(=> 
          @showChildView 'topics', new Topics.IndexList
            collection: topics
        )
        .fail(=> 
          console.log 'topics:load:error'
        )

  class Topics.IndexListItem extends App.ItemView
    template: 'topics/topic_index_list_item'

    tagName: 'li'

  class Topics.IndexList extends App.CollectionView
    childView: Topics.IndexListItem

    tagName: 'ul'
