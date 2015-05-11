do (Backbone, Marionette, Jig, $, _) ->
  class Jig.Page extends Backbone.Model

    ###
    Test to see if view is going to change on update
    ###
    viewIsChanging: ->
      @get('view') is @newAttrs.view

    ###
    Update page attributes.
    ###
    update: (@newAttrs) ->
      @trigger "before:update"

      # Get old attrs and keys.
      oldAttrs  = _.clone @attributes
      oldKeys   = _.keys oldAttrs

      # Loop through keys and nullify values.
      _.each oldKeys, (key) ->
        oldAttrs[key] = null

      # Extend old attrs with new attrs and set the
      # result to the page state model.
      @set _.extend oldAttrs, @newAttrs

      # Delete new attrs property and trigger update.
      delete @newAttrs
      @trigger "update"