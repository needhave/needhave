class CategoriesController < ApplicationController
  model_accessors ({
    queries: [:find, :find_all, :query],
    filters: [:name, :slug]
    limit: nil
  })
end
  