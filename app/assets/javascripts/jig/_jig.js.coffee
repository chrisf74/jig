do (Backbone, Marionette, $, _) ->
  window.Jig =
    VERSION  : '3.0.0'
    appExts  : []
    extendApp: (fn) -> @appExts.push fn