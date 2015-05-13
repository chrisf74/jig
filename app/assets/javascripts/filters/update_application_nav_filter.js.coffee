App.module "Filters", (Filters, App, Backbone, Marionette, $, _) ->
  Filters.updateApplicationNav = (route) ->
      {applicationNav} = App.Models
      {activeTab}      = route

      unless activeTab
        {activeTab} = applicationNav.defaults()

      applicationNav.set 'activeTab', activeTab