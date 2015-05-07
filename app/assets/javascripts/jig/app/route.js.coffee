do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.Route extends Marionette.Object

      # Make sure route class was defined with necessary
      # attributes.
      _validate: ->
        unless @name?
          throw new Error "Route has no name"

        unless @urlPattern?
          throw new Error "#{@name} route has no urlPattern"
          
        unless @action?
          throw new Error "#{@name} route has no action"

      # Initialize route instance. If urlPattern is a
      # string that contains param parts, extract the
      # params and store them as param keys.
      initialize: ->
        @_validate()

        @router = new Backbone.Router
        {@root} = App.historyOptions

        @router.route @urlPattern, "#{@name}", @onMatch
        @listenTo App, "route", @onRoute

        if _.isString @urlPattern
          @paramKeys = @urlPattern.match /(\(\?)?:\w+/g
          @paramKeys = _.map @paramKeys, (key) ->
            key.replace ":", ""

        App.routeInstances[@name] = @

      # Loop through each param key and use its index to
      # get value from arguments.
      parseParams: (args...) ->
        params = {}

        _.each @paramKeys, (key, index) ->
          params[key] = args[index]

        params

      # Replace each param key with its value in the url
      # string. 
      getUrl: (params) ->
        url = @root + @urlPattern

        _.each params, (value, key) ->
          url = url.replace ":#{key}", "#{value}"

        url

      # Called when routes url is matched.
      onMatch: (args...) =>
        App.trigger "route", @name  , args...
        App.trigger "route:#{@name}", args...

        params  = @parseParams args...
        @action = new @action {params: params}
        @action.run() unless @action.autoRun is false

      # Called when any route is matched.
      onRoute: (name, args...) ->
        if @action?.destroy?
          @action.destroy()
          delete @action
