import Model, { attr, belongsTo, hasMany } from '@ember-data/model';

// KEEP UPDATED WITH:
//
//   app/serializers/category_serializer.rb
//
export default class CategoryModel extends Model {
  @attr name;
  @attr slug;
  @attr description;
  @attr displayName;
  @hasMany('category', { inverse: 'parent' }) children;
  @belongsTo('category', { inverse: 'children' }) parent;

  get friendlyName() {
    return this.displayName || this.name;
  }

  // Relationships
  @hasMany('have-post') havePosts;
  @hasMany('need-post') needPosts;
}
