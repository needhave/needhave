class EntitiesController < ApplicationController
  model_accessors Entity, queries: [:find, :query], limit: 100
end
