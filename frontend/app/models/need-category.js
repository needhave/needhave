import Model, { attr, belongsTo } from '@ember-data/model';

// KEEP UPDATED WITH:
//
//   app/serializers/need_categories_serializer.rb
//
export default class NeedCategoryModel extends Model {
  @attr name;
  @attr slug;
  @attr description;
  @hasMany('need-category', { inverse: 'parent' }) children;
  @belongsTo('need-category', { inverse: 'children' }) parent;

  // Relationships
  @hasMany('have-post') havePosts;
  @hasMany('need-post') needPosts;
}
