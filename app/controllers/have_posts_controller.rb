class HavePostsController < ApplicationController
  model_accessors HavePost, queries: [:find, :query], limit: 100
end
