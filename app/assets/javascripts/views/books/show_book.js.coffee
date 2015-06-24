App.module "Books", (Books, App, Backbone, Marionette, $, _) ->
  class Books.Show extends App.ItemView
    template: 'books/show_book'