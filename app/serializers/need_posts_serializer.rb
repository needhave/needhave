# KEEP UPDATED WITH:
#
#   frontend/app/models/need-post.js
#
class NeedPostsSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  attributes :id, :description, :instructions
  has_one :entity
end
