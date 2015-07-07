App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Books extends App.Route
    name: 'books'
    urlPattern: 'books'
    view: App.Books.Index

    action: ->
      @state.books = new App.Models.Books()

  new Routes.Books

  class Routes.Book extends App.Route
    name: 'book'
    urlPattern: 'books/:bookId'
    view: App.Books.Show

    action: ->
      @state.book = new App.Models.Book
        id: @state.bookId

  new Routes.Book