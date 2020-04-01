'use strict';

const EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  let app = new EmberApp(defaults, {});

  // Import vendored assets
  app.import('vendor/semantic-ui/semantic.css');
  app.import('vendor/semantic-ui/semantic.js', {
    using: [ { transformation: 'amd', as: 'semantic-ui' } ]
  });

  return app.toTree();
};
