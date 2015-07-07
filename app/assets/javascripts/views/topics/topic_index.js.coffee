App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->

  ###
  Topic Index Layout
  ###
  class Topics.Index extends App.LayoutView
    template: 'topics/topic_index'

    regions:
      topics: '.topics-list'

  ###
  Topic Index List Item View
  ###
  class Topics.IndexListItem extends App.ItemView
    template: 'topics/topic_index_list_item'

    tagName: 'li'

  ###
  Topic Index List View
  ###
  class Topics.IndexList extends App.CollectionView
    childView: Topics.ListItem

    tagName: 'ul'
