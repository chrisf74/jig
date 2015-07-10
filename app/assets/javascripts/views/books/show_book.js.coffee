App.module "Books", (Books, App, Backbone, Marionette, $, _) ->
  class Books.Show extends App.LayoutView
    template: 'books/show_book'

    regions:
      'heading': '.book-heading'
      'topics' : '.topic-list'

    modelEvents:
      'request': 'showLoadingView'
      'sync'   : 'showLoadedView'

    initialize: ->
      @model = @routeState.get('book')

    onRender: ->
      @model.fetch()

    showLoadingView: ->
      @showChildView 'heading', new App.Views.Loading
      @showChildView 'topics', new App.Views.Loading

    showLoadedView: ->
      @showChildView 'heading', new Books.ShowHeading
        model: @model
      @showChildView 'topics', new App.Topics.IndexList
        collection: @model.topics

    routeStateEvents:
      'change:book': 'changeBook'

    changeBook: ->
      @changeModel(@routeState.get('book'))
      @model.fetch()

  class Books.ShowHeading extends App.ItemView
    template: 'books/show_book_heading'
