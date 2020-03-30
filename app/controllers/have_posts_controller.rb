class HavePostsController < ApplicationController
  model_accessors ({
    queries: [:find],
    includes: [:category, :entity, :location],
    limit: 50
  })
end
