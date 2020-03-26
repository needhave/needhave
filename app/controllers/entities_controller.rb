class EntitiesController < ApplicationController
  resource Entity, [:find, :find_all]
end
