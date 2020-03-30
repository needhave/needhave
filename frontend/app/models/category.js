import Model, { attr, belongsTo, hasMany } from '@ember-data/model';

// KEEP UPDATED WITH:
//
//   app/serializers/category_serializer.rb
//
export default class CategoryModel extends Model {
  @attr name;
  @attr slug;
  @attr description;
  @hasMany('category', { inverse: 'parent' }) children;
  @belongsTo('category', { inverse: 'children' }) parent;

  // Relationships
  @hasMany('have-post') havePosts;
  @hasMany('need-post') needPosts;
}
