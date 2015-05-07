do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.viewHelpers =
      beforeConstructed: (args...) ->
        @pageStateEvents or= {}
        @pageState         = App.pageState
        @model             = @getModel() if @getModel

      afterConstructed: (args...) ->

      bindCustomEntityEvents: (args...) ->
        @bindEntityEvents @pageState, @pageStateEvents
        return @

      unbindCustomEntityEvents: (args...) ->
        @unbindEntityEvents @pageState, @pageStateEvents
        return @

      # Set new model and re-render the view.
      updateModel: (model) ->
        @undelegateEvents()
        @model = model
        @delegateEvents()
        @render()

      # Get model, re-set it and re-render the view.
      refreshModel: ->
        model = @getModel?()
        @updateModel model
