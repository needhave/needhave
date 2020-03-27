'use strict';

const EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  let app = new EmberApp(defaults, {});

  // Define assets from 'vendor/' or 'node_modules/'
  app.import('vendor/semantic/semantic.min.css');
  app.import('vendor/semantic/semantic.min.js');

  return app.toTree();
};
