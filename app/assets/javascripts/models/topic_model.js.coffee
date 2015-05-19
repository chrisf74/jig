App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Topic extends App.Model
    defaults: ->
      questions: null
      figures  : null
      content  : null
      tables   : null

# book
#   has topics
#   has questions
#   has progress

# topic
#   has questions

# question
#   has topics

# quiz
#   has questions
#   has progress