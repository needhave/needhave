# KEEP UPDATED WITH:
#
#   frontend/app/models/need-post.js
#
class NeedPostSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  attributes :id, :description, :instructions
  belongs_to :entity
  belongs_to :location
  belongs_to :category
end
