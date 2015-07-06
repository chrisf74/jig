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
      Set a new model on view and re-render.
      ###
      setModel: (model) ->
        @undelegateEvents()
        @model = model
        @delegateEvents()
        @render()

      ###
      Call load method on models and or collection objects.
      ###
      load: (objs...) ->
        toBeLoaded = _.filter objs, (obj) ->
          obj.isLoaded() isnt true

        if toBeLoaded.length
          @showLoading()
          promises = _.invoke(toBeLoaded, 'load')
          $.when(promises...)
            .fail(=> @showLoadError())
            .done(=> @showLoaded())
        else
          @showLoaded()

      ###
      Overwrite with loading ui.
      ###
      showLoading: ->

      ###
      Overwrite with load error ui.
      ###
      showLoadError: ->

      ###
      Overwrite with loaded ui. 
      ###
      showLoaded: ->
