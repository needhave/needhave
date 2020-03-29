# KEEP UPDATED WITH:
#
#   frontend/app/models/location.js
#
class LocationsSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  # ... add attributes here ...
end
