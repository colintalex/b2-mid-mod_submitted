class AmusementPark < ApplicationRecord
  has_many :rides, -> { order "name asc"}

  def average_thrill_rating
    total_thrill = rides.inject(0){|sum, ride| sum + ride.thrill_rating.to_i}
    (total_thrill.to_f / rides.length).round(1)
  end
end
