import Model, { attr, belongsTo } from '@ember-data/model';

// KEEP UPDATED WITH:
//
//   app/serializers/need_serializer.rb
//
export default class NeedModel extends Model {
  @attr description;
  @attr instructions;
  @belongsTo('entity') entity;
}
