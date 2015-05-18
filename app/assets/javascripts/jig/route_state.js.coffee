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
      newView  = null

      # If the view is going to change, then omit
      # it from the batch set so it can be set
      # last.
      unless newAttrs.view is oldAttrs.view
        newView  = newAttrs.view
        newAttrs = _.omit newAttrs, 'view'
        oldAttrs = _.omit oldAttrs, 'view'
        @trigger 'before:change:view'

      oldKeys = _.keys oldAttrs
      _.each oldKeys, (key) ->
        oldAttrs[key] = null

      @_model.set _.extend oldAttrs, newAttrs
      @_model.set 'view', newView if newView?

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