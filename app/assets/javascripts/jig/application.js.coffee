do (Backbone, Marionette, Jig, $, _) ->
  class Jig.Application extends Marionette.Application

    ###
    Set history options
    ###
    historyOptions: do ->
      options = {pushState:false, root:'#'}

      if (history?.pushState)
        options = {pushState:true, root:'/'}

      return options

    ###
    Template helper functions to be mixed into all views.
    ###
    templateHelpers: {}

    ###
    Extend the application instance with goodness.
    ###
    constructor: (options = {}) ->

      # Apply jig application extensions to this app.
      for appExt in Jig.appExts then appExt(@)

      # Add get route url method to app template helpers.
      _.extend @templateHelpers,
        getRouteUrl: _.bind @getRouteUrl, @

      # Add route state model to app instance.
      @routeState   = options.routeState
      @routeState or= new Jig.RouteState

      # Call marionettes application constructor.
      super options

    ###
    Default ajax options.
    ###
    ajaxOptions: {}

    ###
    Wrap ajax request in a promise.
    ###
    makeAjaxPromise: (options) ->
      deferred = Q.defer()

      # Mix user options with app default options.
      options  = _.extend {}, @ajaxOptions, options

      # Create request.
      request = $.ajax(options)
      .done (response) =>
        deferred.resolve response
      .fail (args...) =>
        deferred.reject args

      # Make available the request.abort method via promise.
      promise = deferred.promise
      promise.abort = -> request.abort()
      return promise

    ###
    Create app router instance.
    ###
    router: new Backbone.Router

    ###
    Shortcut to calling navigate on the router or history.
    ###
    navigate: (args...) ->
      @router.navigate args...

    ###
    Store all route instances here.
    ###
    routeInstances: {}

    ###
    Get a route from route instances.
    ###
    getRoute: (routeName) ->
      route = @routeInstances[routeName]
      unless route
        throw "#{routeName} route does not exist"
      route

    ###
    Generate a route url.
    ###
    getRouteUrl: (routeName, params) ->
      route = @getRoute(routeName)
      route.getUrl params

    ###
    Redirect to a route url.
    ###
    redirectToRoute: (routeName, params = {}, options = {}) ->
      route = @getRoute(routeName)
      options.trigger ?= true
      options.replace ?= true
      @navigate route.getUrl(params), options
