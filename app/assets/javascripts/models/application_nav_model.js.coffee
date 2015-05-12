App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.ApplicationNav extends App.Model
    defaults: ->
      activeTab   : null
      topicsUrl   : null
      questionsUrl: null

    getUrl: (tabName) ->
      name = "#{tabName}Url"
      @get name

    setUrl: (tabName, url) ->
      name = "#{tabName}Url"
      return if @get(name) is undefined
      @set name, url

  Models.applicationNav = new Models.ApplicationNav