import { pluralize } from '@ember/inflector';
import { underscore } from '@ember/string';
import JSONAPIAdapter from '@ember-data/adapter/json-api';

export default class ApplicationAdapter extends JSONAPIAdapter {
  namespace = 'api';
  pathForType(type) {
    return pluralize(underscore(type));
  }
}
