App.module "Books", (Books, App, Backbone, Marionette, $, _) ->
  class Books.Index extends App.LayoutView
    template: 'books/book_index'

    regions:
      books: '.book-list'

    onRender: ->
      books = @routeState.get('books')
      books.fetch()
        .done(=> 
          @showChildView 'books', new Books.IndexList
            collection: books
        )
        .fail(=> 
          console.log 'books:load:error'
        )

  class Books.IndexListItem extends App.ItemView
    template: 'books/book_index_list_item'

    tagName: 'li'

  class Books.IndexList extends App.CollectionView
    childView: Books.IndexListItem

    tagName: 'ul'