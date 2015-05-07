do (Backbone, Marionette, $, _) ->
  window.Jig =
    VERSION  : '0.0.1'
    appExts  : []
    extendApp: (fn) -> @appExts.push fn