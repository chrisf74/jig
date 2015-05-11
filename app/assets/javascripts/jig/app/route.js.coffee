do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.Route extends Marionette.Object

      ###
      Default filter lists.
      ###
      beforeAction: []
      afterAction : []

      ###
      Construct a route.
      ###
      constructor: (options = {}) ->

        # Call inherit filters unless inherit filters
        # option is set to false.
        unless options.inheritFilters is false
          options.inheritFilters = false
          @inheritFilters()

        # Call route super constructor.
        super options

      ###
      Inherit filters from super class definitions.
      ###
      inheritFilters: ->

        # Clone filter lists so we don't pollute the class
        # with inherited filters.
        @beforeAction = @beforeAction.slice(0)
        @afterAction  = @afterAction.slice(0)

        # Loop through ancestors...
        parent = @constructor.__super__
        while parent
          {beforeAction, afterAction} = parent

          # Add parents non duplicate before action filters
          # to this route.
          if beforeAction and beforeAction.length
            for filter in beforeAction
              unless _.contains @beforeAction, filter
                @beforeAction.unshift filter

          # Add parents non duplicate after action filters
          # to this route.
          if afterAction and afterAction.length
            for filter in afterAction
              unless _.contains @afterAction, filter
                @afterAction.unshift filter

          # Find parent of parent.
          parent = parent.constructor.__super__

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
        @root = App.historyOptions.root

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

        # Add route to instances
        App.routeInstances[@name] = @

      ###
      Stuff to do when this route is matched.
      ###
      onMatch: (params...) =>
        @params = @parseParams(params...)
        @state  = {view: @view}

        # Run before action filters.
        proceed = true
        for filter in @beforeAction
          proceed = filter(@)
          break if proceed is false

        # Halt here if any before action filter returned 
        # false. Otherwise call the the action.
        return if proceed is false
        @action?()

        # Update the page model and call after action filters.
        App.page.update(@state)
        for filter in @afterAction then filter(@)

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
