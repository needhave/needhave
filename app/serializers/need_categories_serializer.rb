# KEEP UPDATED WITH:
#
#   frontend/app/models/need-category.js
#
class NeedCategoriesSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  attributes :id, :description, :instructions
  has_one :entity
end
