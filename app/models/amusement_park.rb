class AmusementPark < ApplicationRecord
  has_many :rides, -> { order "name asc"}
end
