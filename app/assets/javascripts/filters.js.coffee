App.module "Filters", (Filters, App, Backbone, Marionette, $, _) ->
  Filters.setNextTopicId = (route) ->
    {topics}  = App.Models
    {topicId} = route.params

    if topicId < topics.length
      route.state.nextTopicId = parseInt(topicId) + 1