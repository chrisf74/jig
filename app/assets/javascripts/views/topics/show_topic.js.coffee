App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->

  ###
  Show Topic View
  ###
  class Topics.Show extends App.LayoutView
    template: 'topics/show_topic'

    regions:
      'content': '.topic-content'

    onRender: ->
      topic = @routeState.get('topic')
      topic.fetch()
        .done(=>
          @showChildView 'content', new Topics.ShowContent
            model: topic
        )
        .fail(=>
          console.log 'topic:load:error'
        )

  ###
  ###
  class Topics.ShowContent extends App.ItemView
    template: 'topics/show_topic_content'
