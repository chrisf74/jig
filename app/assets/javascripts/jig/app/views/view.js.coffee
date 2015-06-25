do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.View extends Marionette.View
      setModel: App.viewHelpers.setModel

      constructor: (args...) ->
        App.viewHelpers.beforeConstructed.call @, args...
        super args...
        App.viewHelpers.afterConstructed.call @, args...

      delegateEvents: (args...) ->
        super args...
        App.viewHelpers.bindCustomEntityEvents.call @, args...

      undelegateEvents: (args...) ->
        super args...
        App.viewHelpers.unbindCustomEntityEvents.call @, args...

      mixinTemplateHelpers: (target) ->
        _.extend target, App.templateHelpers
        super target

      render: () ->
        @triggerMethod 'before:render', @
        @bindUIElements();
        @triggerMethod 'render', @
