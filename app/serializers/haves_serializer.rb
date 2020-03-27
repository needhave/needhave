# KEEP UPDATED WITH:
#
#   frontend/app/models/have.js
#
class HavesSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  # ... add attributes here ...
end
