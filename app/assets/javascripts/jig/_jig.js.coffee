do (Backbone, Marionette, $, _) ->
  window.Jig =
    VERSION  : '2.0.0'
    appExts  : []
    extendApp: (fn) -> @appExts.push fn