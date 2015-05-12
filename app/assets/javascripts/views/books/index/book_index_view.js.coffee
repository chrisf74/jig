App.module "Books.Index", (Index, App, Backbone, Marionette, $, _) ->
  class Index.View extends App.LayoutView
    template: 'books/index/book_index_view'