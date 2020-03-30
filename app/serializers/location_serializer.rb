# KEEP UPDATED WITH:
#
#   frontend/app/models/location.js
#
class LocationSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  # ... add attributes here ...
end
