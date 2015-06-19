App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Topic extends App.Route
    name      : 'topic'
    urlPattern: 'topics/:topicId'
    view      : App.Topics.Show
    action    : ->
    	{topicId}    = @state
    	@state.topic = new App.Models.Topic
    		id: topicId

  new Routes.Topic