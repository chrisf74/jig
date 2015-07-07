App.module "Books", (Books, App, Backbone, Marionette, $, _) ->
  class Books.Show extends App.LayoutView
    template: 'books/show_book'

    regions:
      'content': '.book-content'

    onRender: ->
      book = @routeState.get('book')
      book.fetch()
        .done(=>
          @showChildView 'content', new Books.ShowContent
            model: book
        )
        .fail(=>
          console.log 'book:load:error'
        )

  class Books.ShowContent extends App.ItemView
    template: 'books/show_book_content'
