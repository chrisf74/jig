do (Backbone, Marionette, Jig, $, _) ->
  class App extends Jig.Application
    onBeforeStart: ->
      _.extend @templateHelpers,
        imagePath: @Utils.imagePath

    start: (options) ->
      super options

      {historyOptions} = @
      $(document).on 'click', 'a[href]:not([data-bypass])', (e) ->

        # If preventDefault was called on the event, don't update the URL.
        unless e.isDefaultPrevented()
          $a = $ @

          # Don't hijack if target is blank.
          return if $a.attr('target') is '_blank'

          # Get the absolute anchor href.
          href =
            prop: $a.prop "href"
            attr: $a.attr "href"

          # Get the absolute root.
          {protocol, host} = location
          root = "#{protocol}//#{host}#{historyOptions.root}"

          # Ensure the root is part of the anchor href, meaning it's
          # relative.
          if href.prop.slice(0, root.length) is root
            e.preventDefault()
            Backbone.history.navigate href.attr, true

    onStart: (options) ->
      @user   = new @Models.User options.user
      @layout = new @Application.Layout().render()
      Backbone.history.start @historyOptions

  window.App = new App