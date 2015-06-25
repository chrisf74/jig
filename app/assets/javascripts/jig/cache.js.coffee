do (Backbone, Marionette, Jig, $, _) ->
  class Jig.Cache extends Marionette.Object

    ###
    Key/value pairs.
    ###
    _store: {}

    ###
    Keys.
    ###
    _keys: []

    ###
    Is there a value for a given key?
    ###
    has: (key) ->
      _.contains(@_keys, key)

    ###
    Get a value for a given key.
    ###
    get: (key) ->
      val = @_store[key]
      @trigger('get', key, val)
      val

    ###
    Set a value for a given key.
    ###
    set: (key, val) ->
      @_store[key] = value
      @_keys = _.without(@_keys, key)
      @_keys.push(key)
      @trigger('set', key, val)

    ###
    Unset a value for a given key.
    ###
    unset: (key) ->
      val = @_store[key]
      delete @_store[key]
      @_keys = _.without(@_keys, key)
      @trigger('unset', key, val)
      val

    ###
    Empty cache.
    ###
    empty: ->
      @_store = {}
      @trigger('empty')
