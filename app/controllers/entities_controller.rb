class EntitiesController < ApplicationController
  model_accessors Entity, [:find, :find_all]
end
