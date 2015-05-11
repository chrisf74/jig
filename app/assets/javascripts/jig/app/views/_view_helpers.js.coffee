do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.viewHelpers =

      ###
      Add stuff to views before constructed.
      ###
      beforeConstructed: (args...) ->
        @pageEvents or= {}
        @page         = App.page
        @model        = @getModel() if @getModel

      ###
      Add stuff to views after constructred.
      ###
      afterConstructed: (args...) ->

      ###
      Bind custom entity events here.
      ###
      bindCustomEntityEvents: (args...) ->
        @bindEntityEvents @page, @pageEvents
        return @

      ###
      Unbind custom entity events here.
      ###
      unbindCustomEntityEvents: (args...) ->
        @unbindEntityEvents @page, @pageEvents
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
