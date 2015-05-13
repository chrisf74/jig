App.module "Routes", (Routes, App, Backbone, Marionette, $, _) ->
  class Routes.Books extends Routes.Route
    name        : 'books'
    urlPattern  : 'books'
    activeTab   : 'books'
    view        : App.Books.Index.View

  new Routes.Books

  class Routes.Book extends Routes.Route
    name        : 'book'
    urlPattern  : 'book/:bookId'
    activeTab   : 'books'
    view        : App.Books.Show.View

  new Routes.Book

  ###
    BookTopics
    book/:bookId/topics
    BookQuestions
    book/:bookId/questions
  ###