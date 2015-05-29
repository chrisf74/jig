App.module "Sessions", (Sessions, App, Backbone, Marionette, $, _) ->
  class Sessions.NewView extends App.ItemView
    template: 'sessions/new_session_view'