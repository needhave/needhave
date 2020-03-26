# KEEP UPDATED WITH:
#
#   frontend/app/models/entity.js
#
class EntitySerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  # ... add attributes here ...
end
