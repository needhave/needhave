import Model, { attr } from '@ember-data/model';

// KEEP UPDATED WITH:
//
//   app/serializers/need_serializer.rb
//
export default class NeedModel extends Model {
  @attr id;
  @attr description;
  @attr instructions;
  @belongsTo('entity') entity;
}
