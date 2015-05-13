App.module "Books.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.View extends App.LayoutView
    template: 'books/show/book_show_view'