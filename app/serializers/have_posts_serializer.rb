# KEEP UPDATED WITH:
#
#   frontend/app/models/have-post.js
#
class HavePostsSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  # ... add attributes here ...
end
