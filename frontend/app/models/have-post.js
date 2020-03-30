import Model, { attr } from '@ember-data/model';

// KEEP UPDATED WITH:
//
//   app/serializers/have_post_serializer.rb
//
export default class HavePostModel extends Model {
  @attr description;
  @attr instructions;
  @belongsTo('entity') entity;
  @belongsTo('category') category;
}
