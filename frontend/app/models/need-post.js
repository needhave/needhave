import Model, { attr, belongsTo } from '@ember-data/model';

// KEEP UPDATED WITH:
//
//   app/serializers/need_post_serializer.rb
//
export default class NeedPostModel extends Model {
  @attr description;
  @attr instructions;
  @belongsTo('entity') entity;
  @belongsTo('category') category;
}
