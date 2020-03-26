# KEEP UPDATED WITH:
#
#   frontend/app/models/need.js
#
class NeedSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  attributes :id, :description, :instructions
  belongs_to :entity
end
