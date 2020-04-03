class Mechanic < ApplicationRecord
  validates_presence_of :name, :years_experience

  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def assign_to_ride(ride_id)
    RideMechanic.create(mechanic_id:self.id, ride_id:ride_id)
  end
end
