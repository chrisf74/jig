do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.CompositeView extends Marionette.CompositeView
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

    ###
    Extend app composite view class with view helpers.
    ###
    _.extend(App.CompositeView::, App.viewHelpers)
