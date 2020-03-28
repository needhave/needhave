class HavesController < ApplicationController
  model_accessors Have, queries: [:find, :query], limit: 100
end
