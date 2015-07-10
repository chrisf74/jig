App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Loading extends App.ItemView
  	template: 'shared/loading'