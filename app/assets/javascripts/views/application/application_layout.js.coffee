App.module "Application", (Application, App, Backbone, Marionette, $, _) ->
  class Application.Layout extends App.LayoutView
    el      : 'body'

    template: 'application/application_layout'

    regions:
      'pageRegion': '.js-page-region'

    routeStateEvents:
      'before:change:view': 'emptyPageRegion'
      'change:view'       : 'showPageView'

    initialize: ->
      @model = App.user

    emptyPageRegion: ->
      @pageRegion.empty()

    showPageView: ->
      PageView = @routeState.get('view')
      @showChildView 'pageRegion', new PageView

    onRender: ->
      $('input[name="authenticity_token"]').val(
        $('meta[name="csrf-token"]').attr('content')
      )