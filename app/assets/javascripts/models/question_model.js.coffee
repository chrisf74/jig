App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Question extends App.Model

  class Models.Questions extends App.Collection
    model: Models.Question

    # Get array of question models using ids.
    getByIds: (ids) ->
      _.map ids, (id) => @get(id)

