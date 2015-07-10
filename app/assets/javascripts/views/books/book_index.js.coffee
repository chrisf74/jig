App.module "Books", (Books, App, Backbone, Marionette, $, _) ->
  class Books.Index extends App.LayoutView
    template: 'books/book_index'

    regions:
      books: '.book-list'

    collectionEvents:
      'request': 'showLoadingView'
      'sync'   : 'showLoadedView'

    initialize: ->
      @collection = @routeState.get('books')

    onRender: ->
      @collection.fetch()

    showLoadingView: ->
      @showChildView 'books', new App.Views.Loading

    showLoadedView: ->
      @showChildView 'books', new Books.IndexList
        collection: @collection

  class Books.IndexListItem extends App.ItemView
    template: 'books/book_index_list_item'

    tagName: 'li'

  class Books.IndexList extends App.CollectionView
    childView: Books.IndexListItem

    tagName: 'ul'