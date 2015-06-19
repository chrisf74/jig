App.module "Topics", (Topics, App, Backbone, Marionette, $, _) ->
  class Topics.Show extends App.ItemView
    template: 'topics/show_topic'

    ui:
    	'content': '.content'

    modelEvents:
    	'change:content': 'attachContent'

    getModel: ->
    	@routeState.get('topic')

    attachContent: ->
    	@ui.content.html(@model.get('content'))

    onRender: ->
    	@model.fetch()
