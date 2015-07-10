do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    App.viewHelpers =

      ###
      Add stuff to views before constructed.
      ###
      beforeConstructed: (args...) ->
        @routeStateEvents or= {}
        @routeState         = App.routeState

      ###
      Add stuff to views after constructred.
      ###
      afterConstructed: (args...) ->

      ###
      Bind custom entity events here.
      ###
      bindCustomEntityEvents: (args...) ->
        @bindEntityEvents @routeState, @routeStateEvents
        return @

      ###
      Unbind custom entity events here.
      ###
      unbindCustomEntityEvents: (args...) ->
        @unbindEntityEvents @routeState, @routeStateEvents
        return @

      ###
      Change the views model.
      ###
      changeModel: (model) ->
        return if @isDestroyed
        @undelegateEvents()
        @model = model
        @delegateEvents()