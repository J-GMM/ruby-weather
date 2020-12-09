class Location < ApplicationRecord
  belongs_to :snapshots
  attr_accessor :city, :region, :country
end
