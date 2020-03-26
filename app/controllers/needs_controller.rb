class NeedsController < ApplicationController
  resource Need, [:find, :find_all]
end
