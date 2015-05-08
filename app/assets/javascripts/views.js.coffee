App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Home extends App.ItemView
    template: 'home'

  class Views.TopicIndexItem extends App.ItemView
    template: 'topic_index_item'

  class Views.TopicIndex extends App.CompositeView
    template          : 'topic_index'
    childView         : Views.TopicIndexItem
    childViewContainer: '.topic-list'
    initialize: ->
      @collection = @pageState.get 'topics'

  class Views.ShowTopic extends App.LayoutView
    template: 'show_topic'
    onRender: ->
      topic = @pageState.get('topic')
      @$('.topic-content').html(topic.get('content'))

      @$('.subtopic').hide()
      subtopicId = @pageState.get('subtopicId')
      if subtopicId
        @$("##{subtopicId}").show()
        @$('.topic-content a').hide()

  class Views.EditTopic extends App.ItemView

  class Views.NewTopic extends App.ItemView