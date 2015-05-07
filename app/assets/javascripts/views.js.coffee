App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.TopicIndexItem extends App.ItemView
    template: 'topic_index_item'

  class Views.TopicIndex extends App.CollectionView
    template  : 'topic_index'
    childView : Views.TopicIndexItem
    initialize: ->
      @collection = @pageState.get 'topics'

  class Views.ShowTopic extends App.LayoutView
    template: 'show_topic'
    ui :
      '$content': '.topic-content'
    onRender: ->
      topic = @pageState.get('topic')
      @ui.$content.html topic.get('content')

      subtopicId = @pageState.get('subtopicId')
      if subtopicId
        @$('#'+subtopicId).css('color','#f00')

  class Views.EditTopic extends App.ItemView

  class Views.NewTopic extends App.ItemView