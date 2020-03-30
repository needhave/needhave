class EntitiesController < ApplicationController
  model_accessors queries: [:find, :query], limit: 100
end
