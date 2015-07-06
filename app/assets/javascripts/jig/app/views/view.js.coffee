do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.View extends Marionette.View
      constructor: (args...) ->
        @beforeConstructed args...
        super args...
        @afterConstructed args...

      delegateEvents: (args...) ->
        super args...
        @bindCustomEntityEvents args...

      undelegateEvents: (args...) ->
        super args...
        @unbindCustomEntityEvents args...

      mixinTemplateHelpers: (target) ->
        _.extend target, App.templateHelpers
        super target

      render: () ->
        @triggerMethod 'before:render', @
        @bindUIElements();
        @triggerMethod 'render', @

    ###
    Extend app view class with view helpers.
    ###
    _.extend(App.View::, App.viewHelpers)
