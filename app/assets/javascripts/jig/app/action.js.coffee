do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) ->
    class App.Action extends Marionette.Object

      # Default filters.
      baseBeforeFilters: -> []
      baseAfterFilters : -> []
      beforeFilters    : -> []
      afterFilters     : -> []

      # Make sure the action class is defined with
      # all necessary attributes.
      _validate: ->
        unless @contentView
          throw new Error 'Action has no contentView.'

      # Instantiate filter objects and call run
      # method on each. If a run method returns
      # false, break the loop.
      runFilters: (filters = []) ->
        proceed = true
        for Filter in filters
          proceed = new Filter().run?(@)
          break if proceed is false
        return proceed

      # Create the actions state object. Run before
      # before filters. If no filter returns false
      # trigger run and show methods. Finally run
      # after filters.
      run: ->
        @_validate()

        if @state? then @state = _.clone @state
        else @state = {}

        beforeFilters = @baseBeforeFilters().concat @beforeFilters()
        proceed       = @runFilters beforeFilters
        return if proceed is false

        @triggerMethod 'run'
        @triggerMethod 'show'

        afterFilters = @baseAfterFilters().concat @afterFilters()
        @runFilters afterFilters

      # Attach params to action instance.
      constructor: (options = {}) ->
        @params = options.params
        super options

