App.module "Books", (Books, App, Backbone, Marionette, $, _) ->
  class Books.Show extends App.LayoutView
    template: 'books/show_book'

    regions:
      'heading': '.book-heading'
      'topics' : '.topic-list'

    routeStateEvents:
      'change:book': 'loadModels'

    loadModels: ->
      @book = @routeState.get('book')
      @book.fetch()
        .done(@showLoaded)
        .fail(@showError)

    onRender: ->
      @loadModels()

    showLoaded: =>
      @showChildView 'heading', new Books.ShowHeading
        model: @book
      @showChildView 'topics', new App.Topics.IndexList
        collection: @book.topics

    showError: =>
      console.log "book:loading:error"

  class Books.ShowHeading extends App.ItemView
    template: 'books/show_book_heading'
