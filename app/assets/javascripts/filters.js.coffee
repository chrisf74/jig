# App.module "Filters", (Filters, App, Backbone, Marionette, $, _) ->
#   class Filters.SetNextTopicId extends App.Filter
#     run: (action) ->
#       {topics}  = App.Models
#       {topicId} = action.params

#       if topicId < topics.length
#         action.state.nextTopicId = parseInt(topicId) + 1