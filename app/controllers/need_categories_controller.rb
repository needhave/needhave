class NeedCategoriesController < ApplicationController
  model_accessors NeedCategory, [:find, :find_all, :query], limit: nil
end
  