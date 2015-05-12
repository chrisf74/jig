App.module "Application", (Application, App, Backbone, Marionette, $, _) ->
  class Application.NavView extends App.ItemView
    template: 'application/application_nav_view'

    getModel: ->
      App.Models.applicationNav

    events:
      'click .js-tab-link': 'changeLocation'

    modelEvents:
      'change:activeTab': 'toggleActiveTab'

    toggleActiveTab: ->
      @$('li.active').removeClass 'active'
      activeTab = @model.get 'activeTab'

      $activeTab = @$el.find "[data-tab='#{activeTab}']"
      $activeTab.addClass 'active' if $activeTab.length

    changeLocation: (e) ->
      tab = $(e.currentTarget).closest('li').data 'tab'
      url = @model.getUrl tab

      return unless url

      e.preventDefault()
      App.navigate url, {trigger:true}

    onRender: ->
      @toggleActiveTab()