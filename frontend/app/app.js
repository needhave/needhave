// Enables some sane form interactions
// (see https://github.com/rails/jquery-ujs)
import ujs from '@rails/ujs';
ujs.start();

// Start the ember application
import Application from '@ember/application';
import Resolver from 'ember-resolver';
import loadInitializers from 'ember-load-initializers';
import config from './config/environment';
import './channels';

export default class App extends Application {
  modulePrefix = config.modulePrefix;
  podModulePrefix = config.podModulePrefix;
  Resolver = Resolver;
}

loadInitializers(App, config.modulePrefix);
