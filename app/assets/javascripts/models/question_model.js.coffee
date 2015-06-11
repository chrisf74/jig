App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Question extends App.Model
    defaults: ->
      correctAnswer: null
      response: null
      figures: null
      content: null
      tables: null
      topics: null
      number: null
      id: null

  class Models.Questions extends App.Collection
    model: Models.Question

    # Get array of question models using ids.
    getByIds: (ids) ->
      _.map ids, (id) => @get(id)

