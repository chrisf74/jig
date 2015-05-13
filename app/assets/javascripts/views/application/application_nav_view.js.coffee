App.module "Application", (Application, App, Backbone, Marionette, $, _) ->
  class Application.NavView extends App.ItemView
    template: 'application/application_nav_view'

    getModel: ->
      App.Models.applicationNav

    modelEvents:
      'change:activeTab': 'toggleActiveTab'

    toggleActiveTab: ->
      @$('li.active').removeClass 'active'
      activeTab = @model.get 'activeTab'

      $activeTab = @$el.find "[data-tab='#{activeTab}']"
      $activeTab.addClass 'active' if $activeTab.length

    onRender: ->
      @toggleActiveTab()