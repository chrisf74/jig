do (Backbone, Marionette, Jig, $, _) ->
  class Jig.PageState extends Backbone.Model
    update: (newAttrs) ->
      @trigger "before:update", newAttrs

      oldAttrs = _.clone @attributes
      oldKeys  = _.keys oldAttrs

      _.each oldKeys, (key) ->
        oldAttrs[key] = null

      @set _.extend oldAttrs, newAttrs
      @trigger "update", @attributes