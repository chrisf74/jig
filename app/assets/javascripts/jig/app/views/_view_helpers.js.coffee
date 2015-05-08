do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.viewHelpers =

      ###
      Add stuff to views before constructed.
      ###
      beforeConstructed: (args...) ->
        @pageStateEvents or= {}
        @pageState         = App.pageState
        @model             = @getModel() if @getModel

      ###
      Add stuff to views after constructred.
      ###
      afterConstructed: (args...) ->

      ###
      Bind custom entity events here.
      ###
      bindCustomEntityEvents: (args...) ->
        @bindEntityEvents @pageState, @pageStateEvents
        return @

      ###
      Unbind custom entity events here.
      ###
      unbindCustomEntityEvents: (args...) ->
        @unbindEntityEvents @pageState, @pageStateEvents
        return @

      ###
      Set a new model on view and re-render.
      ###
      updateModel: (model) ->
        @undelegateEvents()
        @model = model
        @delegateEvents()
        @render()

      ###
      Get model, reset it and re-render the view.
      ###
      refreshModel: ->
        model = @getModel?()
        @updateModel model
