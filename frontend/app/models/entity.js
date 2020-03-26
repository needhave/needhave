import Model, { attr } from '@ember-data/model';

// KEEP UPDATED WITH:
//
//   app/serializers/entity_serializer.rb
//
export default class EntityModel extends Model {
  @attr id
}
