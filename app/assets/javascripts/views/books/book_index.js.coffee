App.module "Books", (Books, App, Backbone, Marionette, $, _) ->
  class Books.Index extends App.ItemView
    template: 'books/book_index'