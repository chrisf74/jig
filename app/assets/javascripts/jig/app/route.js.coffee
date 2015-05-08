do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    ###
    TODO: Find out how to mixin super class before/after actions into instances.
    ###
    class App.Route extends Marionette.Object

      ###
      Default filters
      ###
      beforeAction: ['foo']
      afterAction : []

      constructor: (args...) ->
        context = @
        parent  = context.constructor.__super__

        beforeAction = []
        afterAction  = []

        while parent
          if parent.beforeAction and parent.beforeAction.length
            beforeAction.unshift parent.beforeAction...

          if parent.afterAction and parent.afterAction.length
            afterAction.unshift parent.afterAction...

          parent = parent.constructor.__super__

        @beforeAction.unshift beforeAction...
        @afterAction.unshift afterAction...
        super args...

      ###
      Validate route class.
      ###
      validate: ->
        unless @name?
          throw new Error "Route has no name"
        unless @view?
          throw new Error "#{@name} route has no view"
        unless @urlPattern?
          throw new Error "#{@name} route has no urlPattern"

      ###
      Tie this route into the app.
      ###
      initialize: ->
        @validate()

        # Set route on app router. Call on route method when
        # any route is triggered.
        App.router.route @urlPattern, @name, @onMatch
        @listenTo App.router, 'route', @onRoute

        # If url is a string, map and store param keys. Param
        # keys is used by the default parse params method.
        if _.isString @urlPattern
          @paramKeys = @urlPattern.match /(\(\?)?:\w+/g
          @paramKeys = _.map @paramKeys, (key) ->
            key.replace ":", ""

        console.log @

      ###
      Stuff to do when this route is matched.
      ###
      onMatch: (params) =>
        @params = params
        @state  = {}

        # Run before action filters.
        proceed = true
        for filter in @beforeAction
          proceed = filter(@)
          break if proceed is false

        # Halt here if any before action filter returned 
        # false. Otherwise call the the action and show
        # view.
        return if proceed is false
        @action?()
        @showView?()

        # Run after action filters.
        for filter in @afterAction
          filter(@)

      ###
      Stuff to do when route event is triggered.
      ### 
      onRoute: =>
        delete @['params']
        delete @['state']

      ###
      Create object, assign values (args) to keys (param keys).
      ###
      parseParams: (args...) ->
        params = {}
        _.each @paramKeys, (key, index) ->
          params[key] = args[index]
        params

      ###
      Replace keys (params) in url pattern with values (params).
      ###
      getUrl: (params) ->
        url = @root + @urlPattern
        _.each params, (value, key) ->
          url = url.replace ":#{key}", "#{value}"
        url
