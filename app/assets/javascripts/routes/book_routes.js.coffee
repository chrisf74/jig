App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Books extends App.Route
    name      : 'books'
    urlPattern: 'books'
    view      : App.Books.Index

  new Routes.Books

  class Routes.Book extends App.Route
    name      : 'book'
    urlPattern: 'book/:bookId'
    view      : App.Books.Show

  new Routes.Book