do (Backbone, Marionette, Jig, $, _) ->
  class Jig.RouteState extends Marionette.Object

    ###
    Route state model.
    ###
    _model: new Backbone.Model

    ###
    Set new attributes on route state model.
    ###
    _set: (newAttrs) ->
      oldAttrs = _.clone @_model.attributes
      oldView  = oldAttrs.view
      newView  = newAttrs.view

      # Get old and new attributes minus view. We
      # will set that after the new attrs have
      # been set.
      newAttrs = _.omit newAttrs, 'view'
      oldAttrs = _.omit oldAttrs, 'view'
      oldKeys  = _.keys oldAttrs

      # Nullify old attrs.
      _.each oldKeys, (key) ->
        oldAttrs[key] = null

      # Trigger event if view is going to change.
      unless newView is oldView
        @trigger 'before:change:view'

      # Set new attributes.
      @_model.set _.extend oldAttrs, newAttrs

      # Set view.
      @_model.set 'view', newView

    ###
    Get a value from route state model
    ###
    get: ->
      @_model.get arguments...

    ###
    Broadcast all route state model events.
    ###
    initialize: ->
      @listenTo @_model, 'all', =>
        @trigger arguments...