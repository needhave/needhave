import { pluralize } from 'ember-inflector';
import { underscore } from '@ember/string';
import JSONAPIAdapter from '@ember-data/adapter/json-api';

export default class ApplicationAdapter extends JSONAPIAdapter {
  namespace = 'api';

  pathForType(type) {
    return pluralize(underscore(type));
  }

  queryRecord(_store, type, query) {
    const url = `/${this.namespace}/${this.pathForType(type.modelName)}`;
    return this.ajax(url, 'GET', { data: { ...query, limit: 1 } }).then((response) => {
      return response.included
        ? { data: response.data[0], included: response.included }
        : { data: response.data[0] };
    });
  }
}
