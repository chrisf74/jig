do (Backbone, Marionette, Jig, $, _) ->
  class Jig.Cache extends Marionette.Object

    ###
    Key value pairs.
    ###
    _data: {}

    ###
    List of data's keys.
    ###
    _keys: []

    ###
    Set key/value pair to data.
    ###
    set: (key, value) ->
      @trigger('set', key, value)

      # Add key to the end of the keys list.
      @_keys = _.without(@_keys, key)
      @_keys.push(key)

      # Store value at key in data.
      @_data[key] = value

      # If this cache has a size, remove the
      # the oldest key/value pair.
      {size} = @options
      if size and @_keys.length > size
        @unset(@_keys[0])

    ###
    Test whether cache data has a value at given key.
    ###
    has: (key) ->
      has = _.contains(@_keys, key)

      # Trigger has event passing the key and the
      # has boolean.
      @trigger('has', key, has)

      # Return has boolean.
      return has

    ###
    Get value at key from data.
    ###
    get: (key) ->
      value = @_data[key]

      # Trigger get event passing key and value.
      @trigger('get', key, value)

      # Return the value.
      return value

    ###
    Remove key/value pair from cache data.
    ###
    unset: (key) ->
      value = @_data[key]

      # Trigger unset passing the key and value to be
      # unset from this cache instance.
      @trigger('unset', key, value)

      # Do the unset.
      @_keys = _.without(@_keys, key)
      delete @_data[key]

      # Return the unset value.
      value

    ###
    Clear the cache data.
    ###
    clear: ->
      @trigger('clear')
      @_keys = []
      @_data = {}
