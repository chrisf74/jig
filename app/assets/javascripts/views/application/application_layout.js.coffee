App.module "Application", (Application, App, Backbone, Marionette, $, _) ->
  class Application.Layout extends App.LayoutView
    el      : 'body'
    template: 'application/application_layout'

    regions:
      'applicationNavRegion': '.js-application-nav-region'
      'pageRegion'          : '.js-page-region'

    pageEvents:
      'before:update': 'emptyPageView'
      'change:view'  : 'showPageView'

    emptyPageView: ->
      if @page.viewIsChanging()
        @pageRegion.empty()

    showPageView: ->
      PageView = @page.get('view')
      @showChildView 'pageRegion', new PageView

    onRender: ->
      @showChildView 'applicationNavRegion', new Application.NavView