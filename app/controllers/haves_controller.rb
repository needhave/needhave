class HavesController < ApplicationController
  resource Have, [:find, :find_all]
end
