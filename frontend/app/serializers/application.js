import { underscore } from '@ember/string';
import JSONAPISerializer from '@ember-data/serializer/json-api';

export default class ApplicationSerializer extends JSONAPISerializer {
  keyForAttribute(attr) {
    return underscore(attr);
  }
  keyForRelationship(key, _relationship) {
    return underscore(key);
  }
}
