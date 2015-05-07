(function(Backbone, Marionette) {
  _.extend(Marionette.Renderer, {

      render: function (template, data) {
        var fn;
        if (template === false) { return; }

        if (!template) {
          throw new Error(
            'Cannot render the template since its false, null or undefined.'
          );
        }

        if (typeof template === "function") {
          fn = template
        }
        else if (typeof template === "string") {
          fn = JST[template] || JST['templates/' + template];
        }

        if (!fn) {
          throw new Error(
            "Cannot render "+template+" because it cannot be found"
          );
        }
        return fn(data);
      }
  });
}(Backbone, Backbone.Marionette));