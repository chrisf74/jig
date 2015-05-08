do (Backbone, Marionette, Jig, $, _) ->
  class Jig.PageState extends Backbone.Model

    ###
    Update page state attributes.
    ###
    update: (newAttrs) ->
      @trigger "before:update", newAttrs
      oldAttrs = _.clone @attributes
      oldKeys  = _.keys oldAttrs

      # Loop through keys and nullify values.
      _.each oldKeys, (key) ->
        oldAttrs[key] = null

      # Extend old attrs with new attrs and set the
      # result to the page state model.
      @set _.extend oldAttrs, newAttrs
      @trigger "update", @attributes