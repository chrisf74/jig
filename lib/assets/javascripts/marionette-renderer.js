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
          templatePaths = [template, 'views/templates/' + template];
          match = new RegExp('^(.+)/([^/]+)$').exec(template);
          if (match) {
            templatePaths.push('views/' + match[1] + '/templates/' + match[2])
          }
          for (var i = 0; i < templatePaths.length; i++) {
            fn = fn || JST[templatePaths[i]];
          }
        }
        if (!fn) {
          throw new Error(
            "Cannot render "+template+" because it cannot be found"
          );
        }
        data.debug_data = data;
        return '<!-- start ' + template + ' -->' + fn(data) + '<!-- end ' + template + ' -->';
      }
  });
}(Backbone, Backbone.Marionette));