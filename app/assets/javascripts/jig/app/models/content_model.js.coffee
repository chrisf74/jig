do (Backbone, Marionette, Jig, $, _) ->
  Jig.extendApp (App) -> 
    class App.ContentModel extends Backbone.Model
      loadContent: ->
        @_loadedCount or= 0
        @_loadedCount += 1

        return @_contentPromise if @_contentPromise
        @_contentAjaxPromise = App.makeAjaxPromise
          type: 'GET'
          url : @contentUrl()

        @_contentPromise = @_contentAjaxPromise.then (data) =>
            attrs = _.pick data, @contentAttributes
            attrs.loaded = true
            @loaded = true
            @set attrs

        return @_contentPromise

      # Set the table content immediately, but update _loadedCount
      # as if loadContent() were called.
      setContent: (data) ->
        @_loadedCount or= 0
        @_loadedCount += 1

        attrs = _.pick data, @contentAttributes
        attrs.loaded = true
        @loaded = true
        @set attrs

        @_contentPromise = Q.resolve()

      unloadContent: ->
        unless @_loadedCount
          throw new Error """Called unloadContent() more times than 
          loadContent(). Id: #{@id}"""

        @_loadedCount -= 1
        if @_loadedCount is 0
          if @loaded
            newAttrs = {}

            for attrName in @contentAttributes
              newAttrs[attrName] = undefined

            newAttrs.loaded = false
            @loaded = false
            @set newAttrs

          else @_contentAjaxPromise?.abort()

          @_contentAjaxPromise = undefined
          @_contentPromise = undefined
