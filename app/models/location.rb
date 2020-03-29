class Location < ApplicationRecord
    serialize :address, HashSerializer
    store_accessor :address, :street_number, :street_name, :city, :zip_code, :state, :country
end
