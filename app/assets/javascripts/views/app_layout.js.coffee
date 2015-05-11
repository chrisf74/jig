App.module "Mksap", (Mksap, App, Backbone, Marionette, $, _) ->
  class Mksap.View extends App.LayoutView
    el      : 'body'
    template: 'mksap'

    regions:
      'appNavRegion': '.js-app-nav-region'
      'pageRegion'  : '.js-page-region'

    pageEvents:
      'before:update': 'emptyPageView'
      'change:view'  : 'showPageView'

    emptyPageView: ->
      if @page.viewIsChanging()
        @pageRegion.empty()

    showPageView: ->
      PageView = @page.get('view')
      @showChildView 'pageRegion', new PageView