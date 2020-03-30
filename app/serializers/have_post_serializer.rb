# KEEP UPDATED WITH:
#
#   frontend/app/models/have-post.js
#
class HavePostSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  attributes :id, :description, :instructions
  belongs_to :entity
  belongs_to :location
  belongs_to :category
end
