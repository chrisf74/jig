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

      newAttrs = _.omit newAttrs, 'view'
      oldAttrs = _.omit oldAttrs, 'view'
      oldKeys  = _.keys oldAttrs

      _.each oldKeys, (key) ->
        oldAttrs[key] = null

      unless newView is oldView
        @trigger 'before:change:view'

      @_model.set _.extend oldAttrs, newAttrs
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