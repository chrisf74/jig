App.module "Books", (Books, App, Backbone, Marionette, $, _) ->
  class Books.Show extends App.LayoutView
    template: 'books/show_book'

    regions:
      'heading': '.book-heading'
      'topics' : '.topic-list'

    onRender: ->
      book = @routeState.get('book')
      book.fetch()
        .done(=>
          console.log book.get('topics')
          @showChildView 'heading', new Books.ShowHeading
            model: book
          @showChildView 'topics', new App.Topics.IndexList
            collection: book.topics
        )
        .fail(=>
          console.log 'book:load:error'
        )

  class Books.ShowHeading extends App.ItemView
    template: 'books/show_book_heading'
